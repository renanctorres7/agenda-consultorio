import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/external/external.dart';

import '../../../../../../../mocks/mocks.dart';

class UpdateClientServiceMock extends Mock implements UpdateClientService {}

void main() {
  String token = faker.guid.guid();
  final service = UpdateClientServiceMock();
  final datasource = DioUpdateClientDatasource(updateClientService: service);

  final clientsUpdateModel = MocksModels.clientsUpdateModel;

  setUp(() {
    registerFallbackValue(clientsUpdateModel);

    registerFallbackValue(token);
  });

  test('When input a Clients Update Model should return a Successful Response',
      () async {
    when(() => service.updateClient(any(), any())).thenAnswer((_) async {});

    final result = await datasource.updateClient(
        token: token, clientsUpdateEntity: clientsUpdateModel);

    expect(result, SuccessfulResponse());
  });

  test('Should return DataSource Error if gets error', () async {
    when(() => service.updateClient(any(), any())).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.updateClient(
        token: token, clientsUpdateEntity: clientsUpdateModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/clients/data/datasource/datasource.dart';
import 'package:office_schedule/app/features/clients/data/service/service.dart';

import '../../../../../mocks/mocks.dart';

class DeleteClientServiceMock extends Mock implements DeleteClientService {}

void main() {
  final objectId = MocksModels.objectId;
  final token = MocksModels.token;
  final service = DeleteClientServiceMock();
  final datasource = DioDeleteClientDatasource(deleteClientService: service);

  setUp(() {
    registerFallbackValue(objectId);

    registerFallbackValue(token);
  });

  test('Should input a ObjectId and a Token and returns a Succesful response',
      () async {
    when(() => service.deleteClient(any(), any())).thenAnswer((_) async {});

    final result =
        await datasource.deleteClient(token: token, objectId: objectId);

    expect(result, SuccessfulResponse());
  });

  test('Should return DataSource Error if gets error', () async {
    when(() => service.deleteClient(any(), any())).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.deleteClient(token: token, objectId: objectId);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

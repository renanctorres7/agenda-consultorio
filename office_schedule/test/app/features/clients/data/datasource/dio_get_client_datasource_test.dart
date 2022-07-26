import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/clients/data/datasource/datasource.dart';
import 'package:office_schedule/app/features/clients/data/service/service.dart';

import '../../../../../mocks/mocks.dart';

class GetClientServiceMock extends Mock implements GetClientService {}

void main() {
  final objectId = MocksModels.objectId;
  String token = MocksModels.token;
  final service = GetClientServiceMock();
  final datasource = DioGetClientDatasource(getClientService: service);
  final clientsModel = MocksModels.clientsModel;

  setUp(() {
    registerFallbackValue(objectId);

    registerFallbackValue(token);
    registerFallbackValue(clientsModel);
  });

  test('Should input a String ObjectId and returns a Client Model', () async {
    when(() => service.getClient(any(), any()))
        .thenAnswer((_) async => clientsModel);

    final result = await datasource.getClient(token: token, objectId: objectId);

    expect(result, clientsModel);
  });

  test('Should return DataSource Error if gets error', () async {
    when(() => service.getClient(any(), any())).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.getClient(token: token, objectId: objectId);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

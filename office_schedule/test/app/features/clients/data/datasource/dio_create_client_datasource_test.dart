import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/clients/data/datasource/datasource.dart';
import 'package:office_schedule/app/features/clients/data/service/service.dart';

import '../../../../../mocks/mocks.dart';

class CreateClientServiceMock extends Mock implements CreateClientService {}

void main() {
  String token = faker.guid.guid();
  final service = CreateClientServiceMock();
  final datasource = DioCreateClientDatasource(
    createClientService: service,
  );

  final clientsCreateModel = MocksModels.clientsCreateModel;

  setUp(() {
    registerFallbackValue(clientsCreateModel);

    registerFallbackValue(token);
  });

  test('When input a Clients Create Model should return a Successful Response',
      () async {
    when(() => service.createClient(any(), any())).thenAnswer((_) async {});

    final result = await datasource.createClient(
        token: token, clientsCreateEntity: clientsCreateModel);

    expect(result, SuccessfulResponse());
  });

  test('Should return DataSource Error if gets error', () async {
    when(() => service.createClient(any(), any())).thenThrow(DioException(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.createClient(
        token: token, clientsCreateEntity: clientsCreateModel);

    expect(result, throwsA(const TypeMatcher<DioException>()));
  });
}

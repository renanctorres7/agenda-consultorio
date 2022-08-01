import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/clients/infra/datasources/datasource.dart';
import 'package:office_schedule/app/features/clients/infra/repository/repository.dart';

import '../../../../../mocks/mocks.dart';

class ClientsCreateDatasourceMock extends Mock
    implements ClientsCreateDatasource {}

void main() {
  String token = faker.guid.guid();
  final datasource = ClientsCreateDatasourceMock();
  final repository = ClientsCreateRepositoryImpl(datasource);

  final model = MocksModels.clientsCreateModel;

  test('Should input a Client Create Model and return a Sucessful Response',
      () async {
    when(() =>
            datasource.createClient(token: token, clientsCreateEntity: model))
        .thenAnswer((_) async => SuccessfulResponse());

    final result =
        await repository.createClient(token: token, clientsCreateEntity: model);

    expect(result, Right(SuccessfulResponse()));

    verify(() =>
            datasource.createClient(token: token, clientsCreateEntity: model))
        .called(1);
  });

  test('Should return Datasource Error if throws a error', () async {
    when(() =>
            datasource.createClient(token: token, clientsCreateEntity: model))
        .thenThrow(Left(DataSourceError()));

    final result =
        await repository.createClient(token: token, clientsCreateEntity: model);

    expect(result, Left(DataSourceError()));

    verify(() =>
            datasource.createClient(token: token, clientsCreateEntity: model))
        .called(1);
  });
}

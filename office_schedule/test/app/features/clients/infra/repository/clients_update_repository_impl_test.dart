import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/clients/infra/datasources/datasource.dart';
import 'package:office_schedule/app/features/clients/infra/repository/repository.dart';

import '../../../../../mocks/mocks.dart';

class ClientsUpdateDatasourceMock extends Mock
    implements ClientsUpdateDatasource {}

void main() {
  String token = faker.guid.guid();
  final datasource = ClientsUpdateDatasourceMock();
  final repository = ClientsUpdateRepositoryImpl(datasource);

  final model = MocksModels.clientsUpdateModel;

  test('Should input a Client Update Model and return a Sucessful Response',
      () async {
    when(() =>
            datasource.updateClient(token: token, clientsUpdateEntity: model))
        .thenAnswer((_) async => SuccessfulResponse());

    final result =
        await repository.updateClient(token: token, clientsUpdateEntity: model);

    expect(result, Right(SuccessfulResponse()));

    verify(() =>
            datasource.updateClient(token: token, clientsUpdateEntity: model))
        .called(1);
  });

  test('Should return Datasource Error if throws a error', () async {
    when(() =>
            datasource.updateClient(token: token, clientsUpdateEntity: model))
        .thenThrow(Left(DataSourceError()));

    final result =
        await repository.updateClient(token: token, clientsUpdateEntity: model);

    expect(result, Left(DataSourceError()));

    verify(() =>
            datasource.updateClient(token: token, clientsUpdateEntity: model))
        .called(1);
  });
}

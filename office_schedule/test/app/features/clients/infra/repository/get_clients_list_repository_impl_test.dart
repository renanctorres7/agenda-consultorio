import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/clients/infra/datasources/datasource.dart';
import 'package:office_schedule/app/features/clients/infra/models/models.dart';
import 'package:office_schedule/app/features/clients/infra/repository/repository.dart';

import '../../../../../mocks/mocks.dart';

class GetClientsListDatasourceMock extends Mock
    implements GetClientsListDatasource {}

void main() {
  final token = MocksModels.token;

  final datasource = GetClientsListDatasourceMock();
  final repository = GetClientsListRepositoryImpl(datasource);

  final list = <ClientsListModel>[];

  test('Should input a Token and returns a List of Clients List Model',
      () async {
    when(() => datasource.getClientsList(token: token))
        .thenAnswer((_) async => list);

    final result = await repository.getClientsList(token: token);

    expect(result, Right(list));

    verify(() => datasource.getClientsList(token: token)).called(1);
  });

  test('Should return Null Error when receives null value', () async {
    when(() => datasource.getClientsList(token: token))
        .thenAnswer((_) async => null);

    final result = await repository.getClientsList(token: token);

    expect(result, Left(NullError()));

    verify(() => datasource.getClientsList(token: token)).called(1);
  });

  test('Should return Datasource Error if receives error', () async {
    when(() => datasource.getClientsList(token: token))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.getClientsList(token: token);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.getClientsList(token: token)).called(1);
  });
}

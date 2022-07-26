import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/clients/infra/datasources/datasource.dart';
import 'package:office_schedule/app/features/clients/infra/repository/repository.dart';

import '../../../../../mocks/mocks.dart';

class DeleteClientDatasourceMock extends Mock
    implements DeleteClientDatasource {}

void main() {
  final token = MocksModels.token;
  final objectId = MocksModels.objectId;

  final datasource = DeleteClientDatasourceMock();
  final repository = DeleteClientRepositoryImpl(datasource);

  test('Should input a ObjectId and a Token and return a Successful Response',
      () async {
    when(() => datasource.deleteClient(token: token, objectId: objectId))
        .thenAnswer((_) async => SuccessfulResponse());

    final result =
        await repository.deleteClient(token: token, objectId: objectId);

    expect(result, Right(SuccessfulResponse()));

    verify(() => datasource.deleteClient(token: token, objectId: objectId))
        .called(1);
  });

  test('Should return Datasource Error if throws a error', () async {
    when(() => datasource.deleteClient(token: token, objectId: objectId))
        .thenThrow(Left(DataSourceError()));

    final result =
        await repository.deleteClient(token: token, objectId: objectId);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.deleteClient(token: token, objectId: objectId))
        .called(1);
  });
}

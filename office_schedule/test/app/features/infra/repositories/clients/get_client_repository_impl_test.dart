import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';
import 'package:office_schedule/app/features/infra/repositories/clients/get_client_repository_impl.dart';

import '../../../../../mocks/mocks.dart';

class GetClientDatasourceMock extends Mock implements GetClientDatasource {}

void main() {
  final token = MocksModels.token;
  final objectId = MocksModels.objectId;
  final datasource = GetClientDatasourceMock();
  final repository = GetClientRepositoryImp(datasource);
  final clientsModel = MocksModels.clientsModel;

  test('Should input a String ObjectId and returns a Client Model', () async {
    when(() => datasource.getClient(token: token, objectId: objectId))
        .thenAnswer((_) async => clientsModel);

    final result = await repository.getClient(token: token, objectId: objectId);

    expect(result, Right(clientsModel));

    verify(() => datasource.getClient(token: token, objectId: objectId))
        .called(1);
  });

  test('Should returns Null Error if datasource returns null', () async {
    when(() => datasource.getClient(token: token, objectId: objectId))
        .thenAnswer((_) async => null);

    final result = await repository.getClient(token: token, objectId: objectId);

    expect(result, Left(NullError()));

    verify(() => datasource.getClient(token: token, objectId: objectId))
        .called(1);
  });

  test('Should returns Datasource Error if returns error', () async {
    when(() => datasource.getClient(token: token, objectId: objectId))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.getClient(token: token, objectId: objectId);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.getClient(token: token, objectId: objectId))
        .called(1);
  });
}

import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/infra/datasources/storage/storage.dart';
import 'package:office_schedule/app/features/infra/repositories/storage/storage.dart';

class DeleteStorageTokenDatasourceMock extends Mock
    implements DeleteStorageTokenDatasource {}

void main() {
  final datasource = DeleteStorageTokenDatasourceMock();
  final repository = DeleteStorageTokenRepositoryImpl(datasource);

  final key = faker.guid.guid();

  test("Should input a Key and return a Successful Response", () async {
    when(() => datasource.deleteStorageToken(key: key))
        .thenAnswer((_) async => SuccessfulResponse());

    final result = await repository.deleteStorageToken(key: key);

    expect(result, Right(SuccessfulResponse()));
    verify(() => datasource.deleteStorageToken(key: key)).called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.deleteStorageToken(key: key))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.deleteStorageToken(key: key);

    expect(result, Left(DataSourceError()));
    verify(() => datasource.deleteStorageToken(key: key)).called(1);
  });
}

import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/token/infra/datasources/datasources.dart';
import 'package:office_schedule/app/features/token/infra/repository/repository.dart';

class SaveStorageTokenDatasourceMock extends Mock
    implements SaveStorageTokenDatasource {}

void main() {
  final datasource = SaveStorageTokenDatasourceMock();
  final repository = SaveStorageTokenRepositoryImpl(datasource);

  final key = faker.guid.guid();
  final value = faker.guid.guid();

  test("Should input a Key and a Value and return a Successful Response",
      () async {
    when(() => datasource.saveStorageToken(key: key, value: value))
        .thenAnswer((_) async => SuccessfulResponse());

    final result = await repository.saveStorageToken(key: key, value: value);

    expect(result, Right(SuccessfulResponse()));
    verify(() => datasource.saveStorageToken(key: key, value: value)).called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.saveStorageToken(key: key, value: value))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.saveStorageToken(key: key, value: value);

    expect(result, Left(DataSourceError()));
    verify(() => datasource.saveStorageToken(key: key, value: value)).called(1);
  });
}

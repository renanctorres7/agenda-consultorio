import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/features/token/infra/datasources/datasources.dart';
import 'package:office_schedule/app/features/token/infra/repository/repository.dart';

class ReadStorageTokenDatasourceMock extends Mock
    implements ReadStorageTokenDatasource {}

void main() {
  final datasource = ReadStorageTokenDatasourceMock();
  final repository = ReadStorageTokenRepositoryImpl(datasource);

  final key = faker.guid.guid();
  final value = faker.guid.guid();

  test("Should input a Key value and returns a String value", () async {
    when(() => datasource.readStorageToken(key: key))
        .thenAnswer((_) async => value);

    final result = await repository.readStorageToken(key: key);

    expect(result, Right(value));
    verify(() => datasource.readStorageToken(key: key)).called(1);
  });

  test(
      'Should input a Key value and returns a empty String value if Flutter Secure Storage returns null',
      () async {
    when(() => datasource.readStorageToken(key: key))
        .thenAnswer((_) async => null);

    final result = await repository.readStorageToken(key: key);

    expect(result, const Right(''));
    verify(() => datasource.readStorageToken(key: key)).called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.readStorageToken(key: key))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.readStorageToken(key: key);

    expect(result, Left(DataSourceError()));
    verify(() => datasource.readStorageToken(key: key)).called(1);
  });
}

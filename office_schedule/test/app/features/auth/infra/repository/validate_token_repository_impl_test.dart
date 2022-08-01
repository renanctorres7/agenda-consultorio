import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/validate_token_datasource.dart';
import 'package:office_schedule/app/features/auth/infra/repository/validate_token_repository_impl.dart';

class ValidateTokenDatasourceMock extends Mock
    implements ValidateTokenDatasource {}

void main() {
  final datasource = ValidateTokenDatasourceMock();
  final repository = ValidateTokenRepositoryImpl(datasource);

  String token = faker.guid.guid();

  test("Should receive a token value and return a Successful Response",
      () async {
    when(() => datasource.validateToken(token))
        .thenAnswer((_) async => SuccessfulResponse());

    final result = await repository.validateToken(token);

    expect(result, Right(SuccessfulResponse()));
    verify(() => datasource.validateToken(token)).called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.validateToken(token))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.validateToken(token);

    expect(result, Left(DataSourceError()));
    verify(() => datasource.validateToken(token)).called(1);
  });
}

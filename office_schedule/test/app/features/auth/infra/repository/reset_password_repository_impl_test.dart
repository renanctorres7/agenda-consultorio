import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/auth/infra/repository/reset_password_repository_impl.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  final datasource = ResetPasswordDatasourceMock();
  final repository = ResetPasswordRepositoryImpl(datasource);

  String email = faker.internet.email();

  test("Should input an e-mail and return a Successful Response", () async {
    when(() => datasource.resetPassword(email))
        .thenAnswer((_) async => SuccessfulResponse());

    final result = await repository.resetPassword(email);

    expect(result, Right(SuccessfulResponse()));
    verify(() => datasource.resetPassword(email)).called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.resetPassword(email))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.resetPassword(email);

    expect(result, Left(DataSourceError()));
    verify(() => datasource.resetPassword(email)).called(1);
  });
}

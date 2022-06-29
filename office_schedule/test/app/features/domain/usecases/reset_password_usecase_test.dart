import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

import '../../../../mocks/mocks_class.dart';

void main() {
  final repository = ResetPasswordRepositoryMock();
  final usecase = ResetPasswordUsecaseImpl(repository);

  String email = faker.internet.email();
  test("Should input an e-mail and return a Successful Response", () async {
    when(() => repository.resetPassword(email))
        .thenAnswer((invocation) async => Right(SuccessfulResponse()));

    final result = await usecase(email);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.resetPassword(email)).called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.resetPassword(email))
        .thenAnswer((invocation) async => Left(DomainError()));

    final result = await usecase(email);

    expect(result, Left(DomainError()));

    verify(() => repository.resetPassword(email)).called(1);
  });
}

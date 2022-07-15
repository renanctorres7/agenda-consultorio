import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/authentication/validate_token_repository.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/domain/usecases/authentication/validate_token_usecase.dart';

class ValidateTokenRepositoryMock extends Mock
    implements ValidateTokenRepository {}

void main() {
  final repository = ValidateTokenRepositoryMock();
  final usecase = ValidateTokenUsecaseImpl(repository);

  String token = faker.guid.guid();
  test("Should receive a token value and return a Successful Response",
      () async {
    when(() => repository.validateToken(token))
        .thenAnswer((_) async => Right(SuccessfulResponse()));

    final result = await usecase(token);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.validateToken(token)).called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.validateToken(token))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token);

    expect(result, Left(DomainError()));

    verify(() => repository.validateToken(token)).called(1);
  });
}

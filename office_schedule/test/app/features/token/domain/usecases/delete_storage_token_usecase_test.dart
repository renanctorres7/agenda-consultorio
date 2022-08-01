import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/token/domain/repository/repository.dart';
import 'package:office_schedule/app/features/token/domain/usecases/usecases.dart';

class DeleteStorageTokenRepositoryMock extends Mock
    implements DeleteStorageTokenRepository {}

void main() {
  final repository = DeleteStorageTokenRepositoryMock();

  final usecase = DeleteStorageTokenUsecaseImpl(repository);

  final key = faker.guid.guid();

  test('"Should input a Key and return a Successful Response"', () async {
    when(() => repository.deleteStorageToken(key: key))
        .thenAnswer((_) async => Right(SuccessfulResponse()));

    final result = await usecase(key: key);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.deleteStorageToken(key: key)).called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.deleteStorageToken(key: key))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(key: key);

    expect(result, Left(DomainError()));

    verify(() => repository.deleteStorageToken(key: key)).called(1);
  });
}

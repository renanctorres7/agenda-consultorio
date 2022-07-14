import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/domain/usecases/storage/storage.dart';

class SaveStorageTokenRepositoryMock extends Mock
    implements SaveStorageTokenRepository {}

void main() {
  final repository = SaveStorageTokenRepositoryMock();

  final usecase = SaveStorageTokenUsecaseImpl(repository);

  final key = faker.guid.guid();
  final value = faker.guid.guid();

  test('"Should input a Key and a Value and return a Successful Response"',
      () async {
    when(() => repository.saveStorageToken(key: key, value: value))
        .thenAnswer((_) async => Right(SuccessfulResponse()));

    final result = await usecase(key: key, value: value);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.saveStorageToken(key: key, value: value)).called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.saveStorageToken(key: key, value: value))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(key: key, value: value);

    expect(result, Left(DomainError()));

    verify(() => repository.saveStorageToken(key: key, value: value)).called(1);
  });
}

import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/token/domain/repository/repository.dart';
import 'package:office_schedule/app/features/token/domain/usecases/usecases.dart';

class ReadStorageTokenRepositoryMock extends Mock
    implements ReadStorageTokenRepository {}

void main() {
  final repository = ReadStorageTokenRepositoryMock();

  final usecase = ReadStorageTokenUsecaseImpl(repository);

  final key = faker.guid.guid();
  final value = faker.guid.guid();

  test('"Should input a Key and return a String value"', () async {
    when(() => repository.readStorageToken(key: key))
        .thenAnswer((_) async => Right(value));

    final result = await usecase(key: key);

    expect(result, Right(value));

    verify(() => repository.readStorageToken(key: key)).called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.readStorageToken(key: key))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(key: key);

    expect(result, Left(DomainError()));

    verify(() => repository.readStorageToken(key: key)).called(1);
  });
}

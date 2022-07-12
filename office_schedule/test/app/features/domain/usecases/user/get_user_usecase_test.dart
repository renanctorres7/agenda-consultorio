import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  final repository = GetUserRepositoryMock();
  final usecase = GetUserUsecaseImpl(repository);
  final responseBody = UsersEntityMock();

  String objectId = faker.guid.guid();
  test("Should input an object ID and return a Users Entity", () async {
    when(() => repository.getUserProfile(objectId))
        .thenAnswer((_) async => Right(responseBody));

    final result = await usecase(objectId);

    expect(result, Right(responseBody));

    verify(() => repository.getUserProfile(objectId)).called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.getUserProfile(objectId))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(objectId);

    expect(result, Left(DomainError()));

    verify(() => repository.getUserProfile(objectId)).called(1);
  });
}

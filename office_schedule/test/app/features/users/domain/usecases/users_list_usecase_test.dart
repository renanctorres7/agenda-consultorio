import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/features/users/domain/entities/user_entity.dart';
import 'package:office_schedule/app/features/users/domain/usecases/usecase.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  String token = faker.guid.guid();
  final repository = UsersListRepositoryMock();
  final usecase = UsersListUsecaseImpl(repository);

  List<UserEntity> list = [];

  test("Should return a Users Entity List", () async {
    when(() => repository.getUsersList(token))
        .thenAnswer((_) async => Right(list));

    final result = await usecase(token);

    expect(result, Right(list));

    verify(() => repository.getUsersList(token)).called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.getUsersList(token))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token);

    expect(result, Left(DomainError()));

    verify(() => repository.getUsersList(token)).called(1);
  });
}

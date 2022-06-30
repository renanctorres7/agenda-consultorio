import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  final repository = UsersListRepositoryMock();
  final usecase = UsersListUsecaseImpl(repository);

  List<UsersEntity> list = [];

  test("Should return a Users Entity List", () async {
    when(() => repository.getUsersList()).thenAnswer((_) async => Right(list));

    final result = await usecase();

    expect(result, Right(list));

    verify(() => repository.getUsersList()).called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.getUsersList())
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase();

    expect(result, Left(DomainError()));

    verify(() => repository.getUsersList()).called(1);
  });
}

import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';

import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  String token = faker.guid.guid();
  final repository = CreateScheduleRepositoryMock();
  final usecase = CreateScheduleUsecaseImpl(repository);
  final scheduleCreateEntity = ScheduleCreateEntityMock();
  test(
      'Should input an Schedule Create Entity and return a Successful Response ',
      () async {
    when(() => repository.createSchedule(token, scheduleCreateEntity))
        .thenAnswer((_) async => Right(SuccessfulResponse()));

    final result = await usecase(token, scheduleCreateEntity);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.createSchedule(token, scheduleCreateEntity))
        .called(1);
  });

  test('Should return a Domain Error if gets error ', () async {
    when(() => repository.createSchedule(token, scheduleCreateEntity))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token, scheduleCreateEntity);

    expect(result, Left(DomainError()));

    verify(() => repository.createSchedule(token, scheduleCreateEntity))
        .called(1);
  });
}

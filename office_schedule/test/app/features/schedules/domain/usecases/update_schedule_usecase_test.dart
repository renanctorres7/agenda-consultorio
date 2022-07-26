import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/schedules/domain/entities/entities.dart';
import 'package:office_schedule/app/features/schedules/domain/repository/repository.dart';
import 'package:office_schedule/app/features/schedules/domain/usecases/usecase.dart';

class UpdateScheduleRepositoryMock extends Mock
    implements UpdateScheduleRepository {}

class ScheduleUpdateEntityMock extends Mock implements ScheduleUpdateEntity {}

void main() {
  String token = faker.guid.guid();
  final repository = UpdateScheduleRepositoryMock();
  final usecase = UpdateScheduleUsecaseImpl(repository);
  final scheduleUpdateEntity = ScheduleUpdateEntityMock();
  test(
      'Should input an Schedule Update Entity and return a Successful Response ',
      () async {
    when(() => repository.updateSchedule(token, scheduleUpdateEntity))
        .thenAnswer((_) async => Right(SuccessfulResponse()));

    final result = await usecase(token, scheduleUpdateEntity);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.updateSchedule(token, scheduleUpdateEntity))
        .called(1);
  });

  test('Should return a Domain Error if gets error ', () async {
    when(() => repository.updateSchedule(token, scheduleUpdateEntity))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token, scheduleUpdateEntity);

    expect(result, Left(DomainError()));

    verify(() => repository.updateSchedule(token, scheduleUpdateEntity))
        .called(1);
  });
}

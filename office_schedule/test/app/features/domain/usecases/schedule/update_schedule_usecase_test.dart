import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_update_entity.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/schedule/update_schedule_repository.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

class UpdateScheduleRepositoryMock extends Mock
    implements UpdateScheduleRepository {}

class ScheduleUpdateEntityMock extends Mock implements ScheduleUpdateEntity {}

void main() {
  final repository = UpdateScheduleRepositoryMock();
  final usecase = UpdateScheduleUsecaseImpl(repository);
  final scheduleUpdateEntity = ScheduleUpdateEntityMock();
  test(
      'Should input an Schedule Update Entity and return a Successful Response ',
      () async {
    when(() => repository.updateSchedule(scheduleUpdateEntity))
        .thenAnswer((_) async => Right(SuccessfulResponse()));

    final result = await usecase(scheduleUpdateEntity);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.updateSchedule(scheduleUpdateEntity)).called(1);
  });

  test('Should return a Domain Error if gets error ', () async {
    when(() => repository.updateSchedule(scheduleUpdateEntity))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(scheduleUpdateEntity);

    expect(result, Left(DomainError()));

    verify(() => repository.updateSchedule(scheduleUpdateEntity)).called(1);
  });
}

import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/features/schedules/domain/entities/entities.dart';
import 'package:office_schedule/app/features/schedules/domain/repository/repository.dart';
import 'package:office_schedule/app/features/schedules/domain/usecases/usecase.dart';

class ListSchedulePeriodRepositoryMock extends Mock
    implements ListSchedulePeriodRepository {}

class SchedulePeriodEntityMock extends Mock implements SchedulePeriodEntity {}

void main() {
  String token = faker.guid.guid();
  final repository = ListSchedulePeriodRepositoryMock();
  final usecase = ListSchedulePeriodUsecaseImpl(repository);
  List<ScheduleEntity> list = [];
  final schedulePeriodEntity = SchedulePeriodEntityMock();

  test(
      'Should input a Schedule Period Entity and return a Schedule Entity List',
      () async {
    when(() => repository.getScheduleListByPeriod(token, schedulePeriodEntity))
        .thenAnswer((_) async => Right(list));

    final result = await usecase(token, schedulePeriodEntity);

    expect(result, Right(list));

    verify(() =>
            repository.getScheduleListByPeriod(token, schedulePeriodEntity))
        .called(1);
  });

  test('Should return a Domain Error if returns error', () async {
    when(() => repository.getScheduleListByPeriod(token, schedulePeriodEntity))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token, schedulePeriodEntity);

    expect(result, Left(DomainError()));

    verify(() =>
            repository.getScheduleListByPeriod(token, schedulePeriodEntity))
        .called(1);
  });
}

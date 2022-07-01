import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

class ListSchedulePeriodRepositoryMock extends Mock
    implements ListSchedulePeriodRepository {}

class SchedulePeriodEntityMock extends Mock implements SchedulePeriodEntity {}

void main() {
  final repository = ListSchedulePeriodRepositoryMock();
  final usecase = ListSchedulePeriodUsecaseImpl(repository);
  List<ScheduleEntity> list = [];
  final schedulePeriodEntity = SchedulePeriodEntityMock();

  test(
      'Should input a Schedule Period Entity and return a Schedule Entity List',
      () async {
    when(() => repository.getScheduleListByPeriod(schedulePeriodEntity))
        .thenAnswer((_) async => Right(list));

    final result = await usecase(schedulePeriodEntity);

    expect(result, Right(list));

    verify(() => repository.getScheduleListByPeriod(schedulePeriodEntity))
        .called(1);
  });

  test('Should return a Domain Error if returns error', () async {
    when(() => repository.getScheduleListByPeriod(schedulePeriodEntity))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(schedulePeriodEntity);

    expect(result, Left(DomainError()));

    verify(() => repository.getScheduleListByPeriod(schedulePeriodEntity))
        .called(1);
  });
}

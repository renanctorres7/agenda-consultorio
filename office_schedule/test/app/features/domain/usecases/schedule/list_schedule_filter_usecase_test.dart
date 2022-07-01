import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

class ScheduleFilterEntityMock extends Mock implements ScheduleFilterEntity {}

class ListScheduleFilterRepositoryMock extends Mock
    implements ListScheduleFilterRepository {}

void main() {
  final repository = ListScheduleFilterRepositoryMock();
  final usecase = ListScheduleFilterUsecaseImpl(repository);
  List<ScheduleEntity> list = [];
  final scheduleFilter = ScheduleFilterEntityMock();

  test(
      'Should input a Schedule Filter Entity and return a Schedule Entity List',
      () async {
    when(() => repository.getListScheduleByFilter(scheduleFilter))
        .thenAnswer((_) async => Right(list));

    final result = await usecase(scheduleFilter);

    expect(result, Right(list));

    verify(() => repository.getListScheduleByFilter(scheduleFilter)).called(1);
  });

  test('Should return a Domain Error if returns error', () async {
    when(() => repository.getListScheduleByFilter(scheduleFilter))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(scheduleFilter);

    expect(result, Left(DomainError()));

    verify(() => repository.getListScheduleByFilter(scheduleFilter)).called(1);
  });
}

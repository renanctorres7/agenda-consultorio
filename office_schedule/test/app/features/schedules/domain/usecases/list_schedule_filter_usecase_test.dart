import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/features/schedules/domain/entities/entities.dart';
import 'package:office_schedule/app/features/schedules/domain/repository/repository.dart';
import 'package:office_schedule/app/features/schedules/domain/usecases/usecase.dart';

class ScheduleFilterEntityMock extends Mock implements ScheduleFilterEntity {}

class ListScheduleFilterRepositoryMock extends Mock
    implements ListScheduleFilterRepository {}

void main() {
  String token = faker.guid.guid();
  final repository = ListScheduleFilterRepositoryMock();
  final usecase = ListScheduleFilterUsecaseImpl(repository);
  List<ScheduleEntity> list = [];
  final scheduleFilter = ScheduleFilterEntityMock();

  test(
      'Should input a Schedule Filter Entity and return a Schedule Entity List',
      () async {
    when(() => repository.getListScheduleByFilter(token, scheduleFilter))
        .thenAnswer((_) async => Right(list));

    final result = await usecase(token, scheduleFilter);

    expect(result, Right(list));

    verify(() => repository.getListScheduleByFilter(token, scheduleFilter))
        .called(1);
  });

  test('Should return a Domain Error if returns error', () async {
    when(() => repository.getListScheduleByFilter(token, scheduleFilter))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token, scheduleFilter);

    expect(result, Left(DomainError()));

    verify(() => repository.getListScheduleByFilter(token, scheduleFilter))
        .called(1);
  });
}

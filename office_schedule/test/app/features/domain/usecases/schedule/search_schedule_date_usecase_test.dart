import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

class SearchScheduleDateRepositoryMock extends Mock
    implements SearchScheduleDateRepository {}

class ScheduleDateEntityMock extends Mock implements ScheduleDateEntity {}

void main() {
  final repository = SearchScheduleDateRepositoryMock();
  final usecase = SearchScheduleDateUsecaseImpl(repository);
  List<ScheduleEntity> list = [];
  final scheduleDateEntity = ScheduleDateEntityMock();

  test(
      'Should input a Search Date Entity and returns a list of Schedule Entity',
      () async {
    when(() => repository.searchScheduleFromDate(scheduleDateEntity))
        .thenAnswer((_) async => Right(list));

    final result = await usecase(scheduleDateEntity);

    expect(result, Right(list));

    verify(() => repository.searchScheduleFromDate(scheduleDateEntity))
        .called(1);
  });

  test('Should return a Domain Error if gets error', () async {
    when(() => repository.searchScheduleFromDate(scheduleDateEntity))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(scheduleDateEntity);

    expect(result, Left(DomainError()));

    verify(() => repository.searchScheduleFromDate(scheduleDateEntity))
        .called(1);
  });
}

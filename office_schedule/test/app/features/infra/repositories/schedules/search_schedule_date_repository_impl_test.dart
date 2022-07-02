import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/schedules.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';
import 'package:office_schedule/app/features/infra/repositories/repositories.dart';

class SearchScheduleDateDatasourceMock extends Mock
    implements SearchScheduleDateDatasource {}

void main() {
  final datasource = SearchScheduleDateDatasourceMock();
  final repository = SearchScheduleDateRepositoryImpl(datasource);
  List<ScheduleModel> list = [];
  ScheduleDateModel dateModel =
      ScheduleDateModel(endDate: "2022-03-26", startDate: "2022-03-02");

  test('Should input a Schedule Date Model and return a Schedule Model list',
      () async {
    when(() => datasource.searchScheduleFromDate(dateModel))
        .thenAnswer((_) async => list);

    final result = await repository.searchScheduleFromDate(dateModel);

    expect(result, Right(list));

    verify(() => datasource.searchScheduleFromDate(dateModel)).called(1);
  });

  test('Should returns Datasource Error if gets error', () async {
    when(() => datasource.searchScheduleFromDate(dateModel))
        .thenThrow(DataSourceError());

    final result = await repository.searchScheduleFromDate(dateModel);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.searchScheduleFromDate(dateModel)).called(1);
  });

  test('Should returns Null Error if gets null value', () async {
    when(() => datasource.searchScheduleFromDate(dateModel))
        .thenAnswer((_) async => null);

    final result = await repository.searchScheduleFromDate(dateModel);

    expect(result, Left(NullError()));

    verify(() => datasource.searchScheduleFromDate(dateModel)).called(1);
  });
}

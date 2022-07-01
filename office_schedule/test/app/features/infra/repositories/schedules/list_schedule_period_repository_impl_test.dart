import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/list_schedule_period_datasource.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';
import 'package:office_schedule/app/features/infra/repositories/schedules/schedules.dart';

class ListSchedulePeriodDatasourceMock extends Mock
    implements ListSchedulePeriodDatasource {}

void main() {
  final datasource = ListSchedulePeriodDatasourceMock();
  final repository = ListSchedulePeriodRepositoryImpl(datasource);
  List<ScheduleModel> list = [];
  SchedulePeriodModel periodModel = SchedulePeriodModel(page: 0, period: 7);

  test('Should input a Schedule Period Model and return a Schedule Model list',
      () async {
    when(() => datasource.getScheduleListByPeriod(periodModel))
        .thenAnswer((_) async => list);

    final result = await repository.getScheduleListByPeriod(periodModel);

    expect(result, Right(list));

    verify(() => datasource.getScheduleListByPeriod(periodModel)).called(1);
  });

  test('Should returns Datasource Error if gets error', () async {
    when(() => datasource.getScheduleListByPeriod(periodModel))
        .thenThrow(DataSourceError());

    final result = await repository.getScheduleListByPeriod(periodModel);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.getScheduleListByPeriod(periodModel)).called(1);
  });

  test('Should returns Null Error if gets null value', () async {
    when(() => datasource.getScheduleListByPeriod(periodModel))
        .thenAnswer((_) async => null);

    final result = await repository.getScheduleListByPeriod(periodModel);

    expect(result, Left(NullError()));

    verify(() => datasource.getScheduleListByPeriod(periodModel)).called(1);
  });
}

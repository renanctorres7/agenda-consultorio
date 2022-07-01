import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/schedules.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';
import 'package:office_schedule/app/features/infra/repositories/schedules/schedules.dart';

class ListScheduleFilterDatasourceMock extends Mock
    implements ListScheduleFilterDatasource {}

void main() {
  final datasource = ListScheduleFilterDatasourceMock();
  final repository = ListScheduleFilterRepositoryImpl(datasource);
  List<ScheduleModel> list = [];

  final model =
      ScheduleFilterModel(page: 0, period: 7, client: faker.person.name());

  test('Should input a Schedule Filter Model and returns a Schedule Model list',
      () async {
    when(() => datasource.getListScheduleByFilter(model))
        .thenAnswer((_) async => list);

    final result = await repository.getListScheduleByFilter(model);

    expect(result, Right(list));
  });

  test('Should return Null Error if gets null value', () async {
    when(() => datasource.getListScheduleByFilter(model))
        .thenAnswer((_) async => null);

    final result = await repository.getListScheduleByFilter(model);

    expect(result, Left(NullError()));
  });

  test('Should return Datasource Error if gets error', () async {
    when(() => datasource.getListScheduleByFilter(model))
        .thenThrow((_) async => Left(DataSourceError()));

    final result = await repository.getListScheduleByFilter(model);

    expect(result, Left(DataSourceError()));
  });
}
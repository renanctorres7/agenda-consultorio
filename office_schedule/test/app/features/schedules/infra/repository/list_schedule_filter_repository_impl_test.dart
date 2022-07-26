import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/schedules/infra/datasources/datasource.dart';
import 'package:office_schedule/app/features/schedules/infra/models/models.dart';
import 'package:office_schedule/app/features/schedules/infra/repository/repository.dart';

class ListScheduleFilterDatasourceMock extends Mock
    implements ListScheduleFilterDatasource {}

void main() {
  String token = faker.guid.guid();
  final datasource = ListScheduleFilterDatasourceMock();
  final repository = ListScheduleFilterRepositoryImpl(datasource);
  List<ScheduleModel> list = [];

  final model =
      ScheduleFilterModel(page: 0, period: 7, client: faker.person.name());

  test('Should input a Schedule Filter Model and returns a Schedule Model list',
      () async {
    when(() => datasource.getListScheduleByFilter(token, model))
        .thenAnswer((_) async => list);

    final result = await repository.getListScheduleByFilter(token, model);

    expect(result, Right(list));
  });

  test('Should return Null Error if gets null value', () async {
    when(() => datasource.getListScheduleByFilter(token, model))
        .thenAnswer((_) async => null);

    final result = await repository.getListScheduleByFilter(token, model);

    expect(result, Left(NullError()));
  });

  test('Should return Datasource Error if gets error', () async {
    when(() => datasource.getListScheduleByFilter(token, model))
        .thenThrow((_) async => Left(DataSourceError()));

    final result = await repository.getListScheduleByFilter(token, model);

    expect(result, Left(DataSourceError()));
  });
}

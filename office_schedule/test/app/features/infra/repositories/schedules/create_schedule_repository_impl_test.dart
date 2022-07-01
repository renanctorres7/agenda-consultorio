import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';

import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/schedules.dart';
import 'package:office_schedule/app/features/infra/repositories/schedules/schedules.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/mocks_models.dart';

class CreateScheduleDatasourceMock extends Mock
    implements CreateScheduleDatasource {}

void main() {
  final datasource = CreateScheduleDatasourceMock();
  final repository = CreateScheduleRepositoryImpl(datasource);

  final model = MocksModels.scheduleCreateModel;

  test('Should input a Schedule Create Model and return a Sucessful Response',
      () async {
    when(() => datasource.createSchedule(model))
        .thenAnswer((_) async => SuccessfulResponse());

    final result = await repository.createSchedule(model);

    expect(result, Right(SuccessfulResponse()));

    verify(() => datasource.createSchedule(model)).called(1);
  });

  test('Should return Datasource Error if throws a error', () async {
    when(() => datasource.createSchedule(model))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.createSchedule(model);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.createSchedule(model)).called(1);
  });
}

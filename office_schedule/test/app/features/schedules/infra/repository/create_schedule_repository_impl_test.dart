import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/schedules/infra/datasources/datasource.dart';
import 'package:office_schedule/app/features/schedules/infra/repository/repository.dart';


import '../../../../../mocks/mocks.dart';
import '../../../../../mocks/mocks_models.dart';

class CreateScheduleDatasourceMock extends Mock
    implements CreateScheduleDatasource {}

void main() {
  String token = faker.guid.guid();
  final datasource = CreateScheduleDatasourceMock();
  final repository = CreateScheduleRepositoryImpl(datasource);

  final model = MocksModels.scheduleCreateModel;

  test('Should input a Schedule Create Model and return a Sucessful Response',
      () async {
    when(() => datasource.createSchedule(token, model))
        .thenAnswer((_) async => SuccessfulResponse());

    final result = await repository.createSchedule(token, model);

    expect(result, Right(SuccessfulResponse()));

    verify(() => datasource.createSchedule(token, model)).called(1);
  });

  test('Should return Datasource Error if throws a error', () async {
    when(() => datasource.createSchedule(token, model))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.createSchedule(token, model);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.createSchedule(token, model)).called(1);
  });
}

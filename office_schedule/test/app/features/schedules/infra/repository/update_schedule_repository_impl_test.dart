import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/schedules/infra/datasources/datasource.dart';
import 'package:office_schedule/app/features/schedules/infra/repository/repository.dart';

import '../../../../../mocks/mocks.dart';

class UpdateScheduleDatasourceMock extends Mock
    implements UpdateScheduleDatasource {}

void main() {
  String token = faker.guid.guid();
  final datasource = UpdateScheduleDatasourceMock();
  final repository = UpdateScheduleRepositoryImpl(datasource);
  final model = MocksModels.scheduleUpdateModel;

  test('Should input a Schedule Update Model and return a Sucessful Response',
      () async {
    when(() => datasource.updateSchedule(token, model))
        .thenAnswer((_) async => SuccessfulResponse());

    final result = await repository.updateSchedule(token, model);

    expect(result, Right(SuccessfulResponse()));

    verify(() => datasource.updateSchedule(token, model)).called(1);
  });

  test('Should return Datasource Error if throws a error', () async {
    when(() => datasource.updateSchedule(token, model))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.updateSchedule(token, model);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.updateSchedule(token, model)).called(1);
  });
}

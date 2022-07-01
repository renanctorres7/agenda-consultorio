import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/schedules.dart';
import 'package:office_schedule/app/features/infra/repositories/schedules/schedules.dart';

import '../../../../../mocks/mocks.dart';

class UpdateScheduleDatasourceMock extends Mock
    implements UpdateScheduleDatasource {}

void main() {
  final datasource = UpdateScheduleDatasourceMock();
  final repository = UpdateScheduleRepositoryImpl(datasource);
  final model = MocksModels.scheduleUpdateModel;

  test('Should input a Schedule Update Model and return a Sucessful Response',
      () async {
    when(() => datasource.updateSchedule(model))
        .thenAnswer((_) async => SuccessfulResponse());

    final result = await repository.updateSchedule(model);

    expect(result, Right(SuccessfulResponse()));

    verify(() => datasource.updateSchedule(model)).called(1);
  });

  test('Should return Datasource Error if throws a error', () async {
    when(() => datasource.updateSchedule(model))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.updateSchedule(model);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.updateSchedule(model)).called(1);
  });
}

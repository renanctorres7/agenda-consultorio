import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/schedules.dart';
import 'package:office_schedule/app/features/infra/repositories/repositories.dart';

class DeleteScheduleDatasourceMock extends Mock
    implements DeleteScheduleDatasource {}

void main() {
  String token = faker.guid.guid();
  final datasource = DeleteScheduleDatasourceMock();
  final repository = DeleteScheduleRepositoryImpl(datasource);

  String objectId = faker.guid.guid();

  test('Should input a objectId and return a Sucessful Response', () async {
    when(() => datasource.deleteSchedule(token, objectId))
        .thenAnswer((_) async => SuccessfulResponse());

    final result = await repository.deleteSchedule(token, objectId);

    expect(result, Right(SuccessfulResponse()));

    verify(() => datasource.deleteSchedule(token, objectId)).called(1);
  });

  test('Should return Datasource Error if throws a error', () async {
    when(() => datasource.deleteSchedule(token, objectId))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.deleteSchedule(token, objectId);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.deleteSchedule(token, objectId)).called(1);
  });
}

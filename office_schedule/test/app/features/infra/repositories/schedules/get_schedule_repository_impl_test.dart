import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';
import 'package:office_schedule/app/features/infra/repositories/repositories.dart';

import '../../../../../mocks/mocks.dart';

class GetScheduleDatasourceMock extends Mock implements GetScheduleDatasource {}

void main() {
  final datasource = GetScheduleDatasourceMock();
  final repository = GetScheduleRepositoryImpl(datasource);
  String objectId = faker.guid.guid();
  String token = faker.guid.guid();

  final scheduleModel = MocksModels.scheduleModel;

  test("Should input an object id and return a Schedule Model", () async {
    when(() => datasource.getSchedule(token: token, objectId: objectId))
        .thenAnswer((_) async => scheduleModel);

    final result =
        await repository.getSchedule(token: token, objectId: objectId);

    expect(result, Right(scheduleModel));
    verify(() => datasource.getSchedule(token: token, objectId: objectId))
        .called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.getSchedule(token: token, objectId: objectId))
        .thenThrow(DataSourceError());

    final result =
        await repository.getSchedule(token: token, objectId: objectId);

    expect(result, Left(DataSourceError()));
    verify(() => datasource.getSchedule(token: token, objectId: objectId))
        .called(1);
  });

  test("Should return a Null Error if returns null", () async {
    when(() => datasource.getSchedule(token: token, objectId: objectId))
        .thenAnswer((_) async => null);

    final result =
        await repository.getSchedule(token: token, objectId: objectId);

    expect(result, Left(NullError()));
    verify(() => datasource.getSchedule(token: token, objectId: objectId))
        .called(1);
  });
}

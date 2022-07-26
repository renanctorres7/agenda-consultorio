import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/schedule/get_schedule_repository.dart';
import 'package:office_schedule/app/features/domain/usecases/schedule/schedule.dart';

import '../../../../../mocks/mocks.dart';

class GetScheduleRepositoryMock extends Mock implements GetScheduleRepository {}

void main() {
  final repository = GetScheduleRepositoryMock();
  final usecase = GetScheduleUsecaseImpl(repository);
  final responseBody = MocksModels.scheduleModel;

  String objectId = faker.guid.guid();
  String token = faker.guid.guid();

  test("Should input an object ID and return a Schedule Entity", () async {
    when(() => repository.getSchedule(token: token, objectId: objectId))
        .thenAnswer((_) async => Right(responseBody));

    final result = await usecase(token: token, objectId: objectId);

    expect(result, Right(responseBody));

    verify(() => repository.getSchedule(token: token, objectId: objectId))
        .called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.getSchedule(token: token, objectId: objectId))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token: token, objectId: objectId);

    expect(result, Left(DomainError()));

    verify(() => repository.getSchedule(token: token, objectId: objectId))
        .called(1);
  });
}

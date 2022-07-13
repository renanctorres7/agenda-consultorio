import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/domain/usecases/schedule/delete_schedule_usecase.dart';

class DeleteScheduleRepositoryMock extends Mock
    implements DeleteScheduleRepository {}

void main() {
  String token = faker.guid.guid();
  final repository = DeleteScheduleRepositoryMock();
  final usecase = DeleteScheduleUsecaseImpl(repository);
  String objectId = faker.guid.guid();
  test('Should input a object id and return a Successful Response ', () async {
    when(() => repository.deleteSchedule(token, objectId))
        .thenAnswer((_) async => Right(SuccessfulResponse()));

    final result = await usecase(token, objectId);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.deleteSchedule(token, objectId)).called(1);
  });

  test('Should return a Domain Error if gets error ', () async {
    when(() => repository.deleteSchedule(token, objectId))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token, objectId);

    expect(result, Left(DomainError()));

    verify(() => repository.deleteSchedule(token, objectId)).called(1);
  });
}

import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/infra/repositories/repositories.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  final datasource = GetUserDatasourceMock();
  final repository = GetUserRepositoryImpl(datasource);
  String objectId = faker.guid.guid();
  final userModel = MocksModels.usersModel;

  test("Should input an object id and return a Users Model", () async {
    when(() => datasource.getUserProfile(objectId))
        .thenAnswer((_) async => userModel);

    final result = await repository.getUserProfile(objectId);

    expect(result, Right(userModel));
    verify(() => datasource.getUserProfile(objectId)).called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.getUserProfile(objectId))
        .thenThrow(DataSourceError());

    final result = await repository.getUserProfile(objectId);

    expect(result, Left(DataSourceError()));
    verify(() => datasource.getUserProfile(objectId)).called(1);
  });

  test("Should return a Null Error if returns null", () async {
    when(() => datasource.getUserProfile(objectId))
        .thenAnswer((_) async => null);

    final result = await repository.getUserProfile(objectId);

    expect(result, Left(NullError()));
    verify(() => datasource.getUserProfile(objectId)).called(1);
  });
}

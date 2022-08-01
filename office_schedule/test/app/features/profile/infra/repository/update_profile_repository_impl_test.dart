import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';

import 'package:office_schedule/app/features/profile/infra/repository/update_profile_repository_impl.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  String token = faker.guid.guid();
  final datasource = UpdateProfileDatasourceMock();
  final repository = UpdateProfileRepositoryImpl(datasource);
  final userUpdateModel = MocksModels.userUpdateModel;
  final usersModel = MocksModels.usersModel;

  test("Should return Users Model", () async {
    when(() => datasource.updateProfile(token, userUpdateModel))
        .thenAnswer((_) async => usersModel);

    final result = await repository.updateProfile(token, userUpdateModel);

    expect(result, Right(usersModel));

    verify(() => datasource.updateProfile(token, userUpdateModel)).called(1);
  });

  test("Should return Null Error if returns null", () async {
    when(() => datasource.updateProfile(token, userUpdateModel))
        .thenAnswer((_) async => null);

    final result = await repository.updateProfile(token, userUpdateModel);

    expect(result, Left(NullError()));

    verify(() => datasource.updateProfile(token, userUpdateModel)).called(1);
  });

  test("Should return DataSource Error if returns error", () async {
    when(() => datasource.updateProfile(token, userUpdateModel))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.updateProfile(token, userUpdateModel);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.updateProfile(token, userUpdateModel)).called(1);
  });
}

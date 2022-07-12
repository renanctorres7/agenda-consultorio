import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/infra/repositories/repositories.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  final datasource = UpdateProfileDatasourceMock();
  final repository = UpdateProfileRepositoryImpl(datasource);
  final userUpdateModel = MocksModels.userUpdateModel;
  final usersModel = MocksModels.usersModel;

  test("Should return Users Model", () async {
    when(() => datasource.updateProfile(userUpdateModel))
        .thenAnswer((_) async => usersModel);

    final result = await repository.updateProfile(userUpdateModel);

    expect(result, Right(usersModel));

    verify(() => datasource.updateProfile(userUpdateModel)).called(1);
  });

  test("Should return Null Error if returns null", () async {
    when(() => datasource.updateProfile(userUpdateModel))
        .thenAnswer((_) async => null);

    final result = await repository.updateProfile(userUpdateModel);

    expect(result, Left(NullError()));

    verify(() => datasource.updateProfile(userUpdateModel)).called(1);
  });

  test("Should return DataSource Error if returns error", () async {
    when(() => datasource.updateProfile(userUpdateModel))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.updateProfile(userUpdateModel);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.updateProfile(userUpdateModel)).called(1);
  });
}

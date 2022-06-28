import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/infra/repositories/repositories.dart';

import '../../../../mocks/mocks.dart';

void main() {
  final datasource = UpdateProfileDatasourceMock();
  final repository = UpdateProfileRepositoryImpl(datasource);
  final signUpModel = MocksModels.signUpModel;

  test("Should return SignUp Model", () async {
    when(() => datasource.updateProfile(signUpModel))
        .thenAnswer((_) async => signUpModel);

    final result = await repository.updateProfile(signUpModel);

    expect(result, Right(signUpModel));

    verify(() => datasource.updateProfile(signUpModel)).called(1);
  });

  test("Should return Null Error if returns null", () async {
    when(() => datasource.updateProfile(signUpModel))
        .thenAnswer((_) async => null);

    final result = await repository.updateProfile(signUpModel);

    expect(result, Left(NullError()));

    verify(() => datasource.updateProfile(signUpModel)).called(1);
  });

  test("Should return DataSource Error if returns error", () async {
    when(() => datasource.updateProfile(signUpModel))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.updateProfile(signUpModel);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.updateProfile(signUpModel)).called(1);
  });
}

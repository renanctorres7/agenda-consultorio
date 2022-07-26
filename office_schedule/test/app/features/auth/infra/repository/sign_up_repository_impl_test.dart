import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/sign_up_datasource.dart';
import 'package:office_schedule/app/features/auth/infra/repository/sign_up_repository_impl.dart';

import '../../../../../mocks/mocks.dart';

class SignUpDatasourceMock extends Mock implements SignUpDatasource {}

class SignUpEntityMock extends Mock implements SignUpEntity {}

void main() {
  final datasource = SignUpDatasourceMock();
  final repository = SignUpRepositoryImpl(datasource);
  final signUpModel = MocksModels.signUpModel;

  test("Should return SignUp Model", () async {
    when(() => datasource.signUp(signUpModel))
        .thenAnswer((_) async => signUpModel);

    final result = await repository.signUp(signUpModel);

    expect(result, Right(signUpModel));

    verify(() => datasource.signUp(signUpModel)).called(1);
  });

  test("Should return Null Error if returns null", () async {
    when(() => datasource.signUp(signUpModel)).thenAnswer((_) async => null);

    final result = await repository.signUp(signUpModel);

    expect(result, Left(NullError()));

    verify(() => datasource.signUp(signUpModel)).called(1);
  });

  test("Should return DataSource Error if returns error", () async {
    when(() => datasource.signUp(signUpModel))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.signUp(signUpModel);

    expect(result, Left(DataSourceError()));

    verify(() => datasource.signUp(signUpModel)).called(1);
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/login_datasource.dart';
import 'package:office_schedule/app/features/auth/infra/repository/login_repository_impl.dart';

import '../../../../../mocks/mocks.dart';

class LoginDatasourceImpl extends Mock implements LoginDatasource {}

void main() {
  final datasource = LoginDatasourceImpl();
  final repository = LoginRepositoryImpl(datasource);
  final loginEntity = LoginEntityMock();
  final signUpModel = MocksModels.signUpModel;

  test("Should input a Login Entity and return a Sign Up Model", () async {
    when(() => datasource.login(loginEntity))
        .thenAnswer((_) async => signUpModel);

    final result = await repository.login(loginEntity);

    expect(result, Right(signUpModel));
    verify(() => datasource.login(loginEntity)).called(1);
  });

  test("Should return a Null Error if gets null", () async {
    when(() => datasource.login(loginEntity)).thenAnswer((_) async => null);

    final result = await repository.login(loginEntity);

    expect(result, Left(NullError()));
    verify(() => datasource.login(loginEntity)).called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.login(loginEntity))
        .thenThrow(Left(DataSourceError()));

    final result = await repository.login(loginEntity);

    expect(result, Left(DataSourceError()));
    verify(() => datasource.login(loginEntity)).called(1);
  });
}

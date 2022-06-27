import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';
import 'package:office_schedule/app/features/infra/repositories/repositories.dart';

import '../../../../mocks/mocks.dart';

class LoginDatasourceImpl extends Mock implements LoginDatasource {}

void main() {
  final datasource = LoginDatasourceImpl();
  final repository = LoginRepositoryImpl(datasource);
  final loginEntity = LoginEntityMock();
  final signUpModel = MocksModels.signUpModel;

  test("Should input a Login Entity and return a Sign Up Model", () async {
    when(() => datasource.login(loginEntity))
        .thenAnswer((invocation) async => signUpModel);
  });
}

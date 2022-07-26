import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/auth/domain/repository/login_repository.dart';
import 'package:office_schedule/app/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:office_schedule/app/features/auth/domain/usecases/login_usecase.dart';

import '../../../../../mocks/mocks.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  final repository = LoginRepositoryMock();
  final usecase = LoginUsecaseImpl(repository);
  final loginEntity = LoginEntityMock();
  final signUpEntity = SignUpEntityMock();

  test("Should input a Login Entity and return a SignUp Entity", () async {
    when(() => repository.login(loginEntity))
        .thenAnswer((_) async => Right(signUpEntity));

    final result = await usecase(loginEntity);

    expect(result, Right(signUpEntity));

    verify(() => repository.login(loginEntity)).called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.login(loginEntity))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(loginEntity);

    expect(result, Left(DomainError()));

    verify(() => repository.login(loginEntity)).called(1);
  });
}

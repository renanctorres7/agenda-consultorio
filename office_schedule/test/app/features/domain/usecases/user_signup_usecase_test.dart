import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/usecases/user_signup_usecase.dart';

class UserSignUpEntityMock extends Mock implements UserSignUpEntity {}

class UserSignUpRepositoryMock extends Mock implements UserSignUpRepository {}

void main() {
  final repository = UserSignUpRepositoryMock();
  final usecase = UserSignUpUsecaseImpl(repository);
  final params = UserSignUpEntityMock();
  test("Should return an UserSignUp Entity", () async {
    when(() => repository.signUp(params))
        .thenAnswer((_) async => Right(params));
    final result = await usecase(params: params);

    expect(result, Right(params));
    verify(() => repository.signUp(params)).called(1);
  });

  test("Should return Failure Error", () async {
    when(() => repository.signUp(params))
        .thenAnswer((_) async => Left(ServerError()));
    final result = await usecase(params: params);

    expect(result, Left(ServerError()));
    verify(() => repository.signUp(params)).called(1);
  });
}

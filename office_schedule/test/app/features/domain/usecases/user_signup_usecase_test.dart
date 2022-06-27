import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/usecases/sign_up_usecase.dart';

import '../../../../mocks/mocks_class.dart';

class SignUpRepositoryMock extends Mock implements SignUpRepository {}

void main() {
  final repository = SignUpRepositoryMock();
  final usecase = UserSignUpUsecaseImpl(repository);
  final params = SignUpEntityMock();
  test("Should return an UserSignUp Entity", () async {
    when(() => repository.signUp(params))
        .thenAnswer((_) async => Right(params));
    final result = await usecase(params);

    expect(result, Right(params));
    verify(() => repository.signUp(params)).called(1);
  });

  test("Should return Failure Error", () async {
    when(() => repository.signUp(params))
        .thenAnswer((_) async => Left(DomainError()));
    final result = await usecase(params);

    expect(result, Left(ServerError()));
    verify(() => repository.signUp(params)).called(1);
  });
}

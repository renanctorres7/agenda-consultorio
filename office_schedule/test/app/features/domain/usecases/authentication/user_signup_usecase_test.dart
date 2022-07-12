import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

import '../../../../../mocks/mocks.dart';

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

    expect(result, Left(DomainError()));
    verify(() => repository.signUp(params)).called(1);
  });
}

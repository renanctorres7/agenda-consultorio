import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';
import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

import '../../../../mocks/mocks.dart';

void main() {
  final repository = ChangePasswordRepositoryMock();
  final usecase = ChangePasswordUsecaseImpl(repository);
  final newPasswordEntity = NewPasswordEntityMock();

  test("Should input a New Password Entity and return a Successful Response",
      () async {
    when(() => repository.changePasswordEmail(newPasswordEntity))
        .thenAnswer((invocation) async => Right(SuccessfulResponse()));

    final result = await usecase(newPasswordEntity);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.changePasswordEmail(newPasswordEntity)).called(1);
  });

  test("Should return Domain Error when gets error", () async {
    when(() => repository.changePasswordEmail(newPasswordEntity))
        .thenAnswer((invocation) async => Left(DomainError()));

    final result = await usecase(newPasswordEntity);

    expect(result, Left(DomainError()));

    verify(() => repository.changePasswordEmail(newPasswordEntity)).called(1);
  });
}

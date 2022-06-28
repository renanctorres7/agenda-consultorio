import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/usecases/update_profile_usecase.dart';

import '../../../../mocks/mocks.dart';

class UpdateProfileRepositoryMock extends Mock
    implements UpdateProfileRepository {}

void main() {
  final repository = UpdateProfileRepositoryMock();
  final usecase = UpdateProfileUsecaseImpl(repository);
  final params = SignUpEntityMock();
  test("Should return an UserSignUp Entity", () async {
    when(() => repository.updateProfile(params))
        .thenAnswer((_) async => Right(params));
    final result = await usecase(params);

    expect(result, Right(params));
    verify(() => repository.updateProfile(params)).called(1);
  });

  test("Should return Failure Error", () async {
    when(() => repository.updateProfile(params))
        .thenAnswer((_) async => Left(DomainError()));
    final result = await usecase(params);

    expect(result, Left(DomainError()));
    verify(() => repository.updateProfile(params)).called(1);
  });
}

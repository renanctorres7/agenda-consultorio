import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/features/profile/domain/repository/update_profile_repository.dart';
import 'package:office_schedule/app/features/users/domain/usecases/usecase.dart';

import '../../../../../mocks/mocks.dart';

class UpdateProfileRepositoryMock extends Mock
    implements UpdateProfileRepository {}

void main() {
  String token = faker.guid.guid();
  final repository = UpdateProfileRepositoryMock();
  final usecase = UpdateProfileUsecaseImpl(repository);
  final params = UserUpdateEntityMock();
  final userEntity = UsersEntityMock();
  test("Should return an User Entity", () async {
    when(() => repository.updateProfile(token, params))
        .thenAnswer((_) async => Right(userEntity));
    final result = await usecase(token, params);

    expect(result, Right(userEntity));
    verify(() => repository.updateProfile(token, params)).called(1);
  });

  test("Should return Failure Error", () async {
    when(() => repository.updateProfile(token, params))
        .thenAnswer((_) async => Left(DomainError()));
    final result = await usecase(token, params);

    expect(result, Left(DomainError()));
    verify(() => repository.updateProfile(token, params)).called(1);
  });
}

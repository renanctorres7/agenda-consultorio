import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/usecases/usecases.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

class LoginEntityMock extends Mock implements LoginEntity {}

void main() {
  final repository = LoginRepositoryMock();
  final usecase = LoginUsecaseImpl(repository);
  final loginEntity = LoginEntityMock();

  test("Should return Login Entity", () async {
    when(() => repository.login(loginEntity))
        .thenAnswer((invocation) async => Right(entity));
  });
}

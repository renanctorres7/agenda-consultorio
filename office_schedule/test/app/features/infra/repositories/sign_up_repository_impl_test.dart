import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/infra/datasources/sign_up_datasource.dart';
import 'package:office_schedule/app/features/infra/models/sign_up/sign_up_model.dart';
import 'package:office_schedule/app/features/infra/repositories/sign_up_repository_impl.dart';

class SignUpDatasourceMock extends Mock implements SignUpDatasource {}

class SignUpEntityMock extends Mock implements SignUpEntity {}

void main() {
  final datasource = SignUpDatasourceMock();
  final repository = SignUpRepositoryImpl(datasource);
  final model = SignUpModel(
      email: faker.internet.email(),
      password: faker.internet.password(),
      fullName: faker.person.name(),
      phone: faker.phoneNumber.us(),
      company: faker.company.name(),
      specialty: faker.company.position(),
      token: "",
      objectId: "");

  test("Should return SignUp Model", () async {
    when(() => datasource.signUp(model)).thenAnswer((_) async => model);

    final result = await repository.signUp(model);

    expect(result, Right(model));

    verify(() => datasource.signUp(model)).called(1);
  });
}

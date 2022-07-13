import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';
import 'package:office_schedule/app/features/infra/repositories/repositories.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  String token = faker.guid.guid();
  final datasource = ChangePasswordDatasourceMock();
  final repository = ChangePasswordRepositoryImpl(datasource);

  final newPasswordModel = MocksModels.newPasswordModel;

  test("Should input a Login Entity and return a Sign Up Model", () async {
    when(() => datasource.changePasswordEmail(token, newPasswordModel))
        .thenAnswer((_) async => SuccessfulResponse());

    final result =
        await repository.changePasswordEmail(token, newPasswordModel);

    expect(result, Right(SuccessfulResponse()));
    verify(() => datasource.changePasswordEmail(token, newPasswordModel))
        .called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.changePasswordEmail(token, newPasswordModel))
        .thenThrow(Left(DataSourceError()));

    final result =
        await repository.changePasswordEmail(token, newPasswordModel);

    expect(result, Left(DataSourceError()));
    verify(() => datasource.changePasswordEmail(token, newPasswordModel))
        .called(1);
  });
}

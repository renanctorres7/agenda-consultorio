import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/features/users/infra/models/user_model.dart';
import 'package:office_schedule/app/features/users/infra/repository/repository.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  String token = faker.guid.guid();
  final datasource = UsersListDatasourceMock();
  final repository = UsersListRepositoryImpl(datasource);

  List<UserModel> list = [];

  test("Should input an object id and return a Users Model", () async {
    when(() => datasource.getUsersList(token)).thenAnswer((_) async => list);

    final result = await repository.getUsersList(token);

    expect(result, Right(list));
    verify(() => datasource.getUsersList(token)).called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.getUsersList(token)).thenThrow(DataSourceError());

    final result = await repository.getUsersList(token);

    expect(result, Left(DataSourceError()));
    verify(() => datasource.getUsersList(token)).called(1);
  });

  test("Should return a Null Error if returns null", () async {
    when(() => datasource.getUsersList(token)).thenAnswer((_) async => null);

    final result = await repository.getUsersList(token);

    expect(result, Left(NullError()));
    verify(() => datasource.getUsersList(token)).called(1);
  });
}

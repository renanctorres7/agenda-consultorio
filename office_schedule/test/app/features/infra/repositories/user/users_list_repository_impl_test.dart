import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';
import 'package:office_schedule/app/features/infra/repositories/repositories.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  final datasource = UsersListDatasourceMock();
  final repository = UsersListRepositoryImpl(datasource);

  List<UserModel> list = [];

  test("Should input an object id and return a Users Model", () async {
    when(() => datasource.getUsersList()).thenAnswer((_) async => list);

    final result = await repository.getUsersList();

    expect(result, Right(list));
    verify(() => datasource.getUsersList()).called(1);
  });

  test("Should return a Datasource Error if gets error", () async {
    when(() => datasource.getUsersList()).thenThrow(DataSourceError());

    final result = await repository.getUsersList();

    expect(result, Left(DataSourceError()));
    verify(() => datasource.getUsersList()).called(1);
  });

  test("Should return a Null Error if returns null", () async {
    when(() => datasource.getUsersList()).thenAnswer((_) async => null);

    final result = await repository.getUsersList();

    expect(result, Left(NullError()));
    verify(() => datasource.getUsersList()).called(1);
  });
}

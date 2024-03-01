import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/users/data/datasource/dio_users_list_datasource.dart';
import 'package:office_schedule/app/features/users/data/service/service.dart';

import '../../../../../mocks/mocks.dart';

class GetUsersListServiceMock extends Mock implements GetUsersListService {}

void main() {
  String token = faker.guid.guid();
  final getUsersListService = GetUsersListServiceMock();
  final datasource =
      DioUsersListDatasource(getUsersListService: getUsersListService);

  final list = [MocksModels.usersModel];

  test('Should get Token value and return a Users Model List', () async {
    when(() => getUsersListService.getUsersList(token))
        .thenAnswer((_) async => list);

    final result = await datasource.getUsersList(token);

    expect(result, list);
  });

  test(
      'When Get Users List Service gets null value should return a empty list from Datasource',
      () async {
    when(() => getUsersListService.getUsersList(token))
        .thenAnswer((_) async => null);

    final result = await datasource.getUsersList(token);

    expect(result, []);
  });

  test('Should throws a Dio Error if gets error', () async {
    when(() => getUsersListService.getUsersList(token)).thenThrow(DioException(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.getUsersList(token);

    expect(result, throwsA(const TypeMatcher<DioException>()));
  });
}

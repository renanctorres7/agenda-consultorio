import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/external/remote/dio/datasource/user/user.dart';
import 'package:office_schedule/app/features/external/remote/dio/service/user/get_users_list_service.dart';

import '../../../../../../../mocks/mocks.dart';

class GetUsersListServiceMock extends Mock implements GetUsersListService {}

void main() {
  String token = faker.guid.guid();
  final getUsersListService = GetUsersListServiceMock();
  final datasource = DioUsersListDatasource(
      getUsersListService: getUsersListService, token: token);

  final list = [MocksModels.usersModel];

  test('Should input a token and return a Users Model List', () async {
    when(() => getUsersListService.getUsersList(token))
        .thenAnswer((_) async => list);

    final result = await datasource.getUsersList();

    expect(result, list);
  });
}

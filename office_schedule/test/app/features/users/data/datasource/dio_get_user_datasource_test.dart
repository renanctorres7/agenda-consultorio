import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/users/data/datasource/dio_get_user_datasource.dart';
import 'package:office_schedule/app/features/users/data/service/service.dart';

import '../../../../../mocks/mocks.dart';

class GetUserServiceMock extends Mock implements GetUserService {}

void main() {
  String token = faker.guid.guid();
  final service = GetUserServiceMock();
  final datasource = DioGetUserDatasource(getUserService: service);
  final objectId = faker.guid.guid();
  final usersModel = MocksModels.usersModel;

  Map<String, String> mapObjectId = {'objectId': objectId};
  test('Input a String e-mail and returns Successful Response', () async {
    when(() => service.getUserProfile(token, mapObjectId))
        .thenAnswer((_) async => usersModel);

    final result = await datasource.getUserProfile(token, objectId);

    expect(result, usersModel);
  });

  test('Should throw a Dio Error if gets error', () async {
    when(() => service.getUserProfile(token, mapObjectId)).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.getUserProfile(token, objectId);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

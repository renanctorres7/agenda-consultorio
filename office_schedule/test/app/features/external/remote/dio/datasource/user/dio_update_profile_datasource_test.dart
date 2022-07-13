import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/external/external.dart';

import '../../../../../../../mocks/mocks.dart';

class UpdateProfileServiceMock extends Mock implements UpdateProfileService {}

void main() {
  String sessionToken = faker.guid.guid();
  final updateProfileService = UpdateProfileServiceMock();
  final datasource = DioUpdateProfileDatasource(
      updateProfileService: updateProfileService, sessionToken: sessionToken);
  final userUpdateModelMock = UserUpdateModelMock();
  final userUpdateModel = MocksModels.userUpdateModel;
  final usersModel = MocksModels.usersModel;

  setUp(() {
    registerFallbackValue(sessionToken);
    registerFallbackValue(userUpdateModel);
    registerFallbackValue(usersModel);

    registerFallbackValue(userUpdateModelMock);
  });

  test('When input a Sign Up Model should return a Sign Up Model', () async {
    when(() => updateProfileService.updateProfile(any(), any()))
        .thenAnswer((_) async => usersModel);

    final result = await datasource.updateProfile(userUpdateModel);

    expect(result, usersModel);
  });

  test('Should throw a Dio Error if gets error', () async {
    when(() => updateProfileService.updateProfile(any(), any()))
        .thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.updateProfile(userUpdateModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

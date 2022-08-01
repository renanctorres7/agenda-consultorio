import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/profile/data/datasource/dio_update_profile_datasource.dart';
import 'package:office_schedule/app/features/profile/data/service/update_profile_service.dart';

import '../../../../../mocks/mocks.dart';

class UpdateProfileServiceMock extends Mock implements UpdateProfileService {}

void main() {
  String token = faker.guid.guid();
  final updateProfileService = UpdateProfileServiceMock();
  final datasource =
      DioUpdateProfileDatasource(updateProfileService: updateProfileService);
  final userUpdateModelMock = UserUpdateModelMock();
  final userUpdateModel = MocksModels.userUpdateModel;
  final usersModel = MocksModels.usersModel;

  setUp(() {
    registerFallbackValue(token);
    registerFallbackValue(userUpdateModel);
    registerFallbackValue(usersModel);

    registerFallbackValue(userUpdateModelMock);
  });

  test('When input a Sign Up Model should return a Sign Up Model', () async {
    when(() => updateProfileService.updateProfile(any(), any()))
        .thenAnswer((_) async => usersModel);

    final result = await datasource.updateProfile(token, userUpdateModel);

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

    final result = datasource.updateProfile(token, userUpdateModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

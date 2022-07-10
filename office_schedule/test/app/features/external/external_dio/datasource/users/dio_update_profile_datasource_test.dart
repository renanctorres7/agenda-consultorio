import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/external/external_dio/datasource/users/dio_update_profile_datasource.dart';
import 'package:office_schedule/app/features/external/external_dio/service/users/users.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../../../../mocks/mocks_models.dart';

class UpdateProfileServiceMock extends Mock implements UpdateProfileService {}

class SignUpModelMock extends Mock implements SignUpModel {}

void main() {
  String sessionToken = faker.guid.guid();
  final updateProfileService = UpdateProfileServiceMock();
  final datasource = DioUpdateProfileDatasource(
      updateProfileService: updateProfileService, sessionToken: sessionToken);

  final signUpModel = MocksModels.signUpModel;

  final signUpModelMock = SignUpModelMock();

  setUp(() {
    registerFallbackValue(sessionToken);
    registerFallbackValue(signUpModel);
    registerFallbackValue(signUpModelMock);
  });

  test('When input a Sign Up Model should return a Sign Up Model', () async {
    when(() => updateProfileService.updateProfile(any(), any()))
        .thenAnswer((_) async => signUpModel);

    final result = await datasource.updateProfile(signUpModel);

    expect(result, signUpModel);
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

    final result = datasource.updateProfile(signUpModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/external/external.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../../../../../mocks/mocks.dart';

class LoginServiceMock extends Mock implements LoginService {}

class SignUpModelMock extends Mock implements SignUpModel {}

void main() {
  late LoginServiceMock loginService;
  late DioLoginDatasource dioDatasource;
  final loginModel = MocksModels.loginModel;

  final model = SignUpModelMock();

  setUp(() async {
    registerFallbackValue(model);
    registerFallbackValue(loginModel);

    loginService = LoginServiceMock();
    dioDatasource = DioLoginDatasource(loginService: loginService);
  });

  test('Should receive a login model and return a Sign Up Model', () async {
    when(() => loginService.login(any())).thenAnswer((_) async => model);

    final result = await dioDatasource.login(loginModel);

    expect(result, equals(model));
  });

  test('Should throw a Dio Error if gets error', () async {
    when(() => loginService.login(any())).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = dioDatasource.login(loginModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

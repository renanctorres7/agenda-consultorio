import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/external/external_dio/external_dio.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../../../../mocks/mocks.dart';

class SignUpServiceMock extends Mock implements SignUpService {}

class SignUpModelMock extends Mock implements SignUpModel {}

void main() {
  late SignUpServiceMock signUpServiceMock;
  late DioSignUpDatasource datasource;
  final signUpModel = MocksModels.signUpModel;

  final signUpMock = SignUpModelMock();

  setUp(() async {
    registerFallbackValue(signUpMock);
    registerFallbackValue(signUpModel);

    signUpServiceMock = SignUpServiceMock();
    datasource = DioSignUpDatasource(signUpService: signUpServiceMock);
  });

  test('Should receive a Sign Up Model and return a Sign Up Model', () async {
    when(() => signUpServiceMock.signUp(any()))
        .thenAnswer((_) async => signUpMock);

    final result = await datasource.signUp(signUpModel);

    expect(result, equals(signUpMock));
  });

  test('Should throw a Dio Error if gets error', () async {
    when(() => signUpServiceMock.signUp(any())).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.signUp(signUpModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

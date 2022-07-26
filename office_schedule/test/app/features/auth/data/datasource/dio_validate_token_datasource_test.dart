import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/auth/data/datasource/dio_validate_token_datasource.dart';
import 'package:office_schedule/app/features/auth/data/service/validate_token_service.dart';

class ValidateTokenServiceMock extends Mock implements ValidateTokenService {}

void main() {
  final validateTokenService = ValidateTokenServiceMock();
  final datasource =
      DioValidateTokenDatasource(validateTokenService: validateTokenService);
  String token = faker.guid.guid();

  test('Input a String token and returns Successful Response', () async {
    when(() => validateTokenService.validateToken(token))
        .thenAnswer((_) async {});

    final result = await datasource.validateToken(token);

    expect(result, SuccessfulResponse());
  });

  test('Should throw a Dio Error if gets error', () async {
    when(() => validateTokenService.validateToken(token)).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.validateToken(token);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

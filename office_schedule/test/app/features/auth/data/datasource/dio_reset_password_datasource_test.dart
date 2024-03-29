import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/auth/data/datasource/dio_reset_password_datasource.dart';
import 'package:office_schedule/app/features/auth/data/service/reset_password_service.dart';

class ResetPasswordServiceMock extends Mock implements ResetPasswordService {}

void main() {
  final service = ResetPasswordServiceMock();
  final datasource = DioResetPasswordDatasource(resetPasswordService: service);
  final email = faker.internet.email();
  Map<String, String> mapEmail = {'email': email};
  test('Input a String e-mail and returns Successful Response', () async {
    when(() => service.resetPassword(mapEmail)).thenAnswer((_) async {});

    final result = await datasource.resetPassword(email);

    expect(result, SuccessfulResponse());
  });

  test('Should throw a Dio Error if gets error', () async {
    when(() => service.resetPassword(mapEmail)).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.resetPassword(email);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

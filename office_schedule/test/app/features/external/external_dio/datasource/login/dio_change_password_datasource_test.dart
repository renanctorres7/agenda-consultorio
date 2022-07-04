import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/external/external_dio/external_dio.dart';
import 'package:office_schedule/app/features/external/external_dio/service/login/change_password_service.dart';

import '../../../../../../mocks/mocks.dart';

class ChangePasswordServiceMock extends Mock implements ChangePasswordService {}

void main() {
  late ChangePasswordServiceMock changePasswordServiceMock;
  late DioChangePasswordDatasource datasource;

  final newPasswordModelMock = MocksModels.newPasswordModel;
  String sessionToken = faker.guid.guid();

  setUp(() {
    registerFallbackValue(newPasswordModelMock);

    registerFallbackValue(sessionToken);

    changePasswordServiceMock = ChangePasswordServiceMock();
    datasource = DioChangePasswordDatasource(
        changePasswordService: changePasswordServiceMock,
        sessionToken: sessionToken);
  });

  test('Should input a New Password Model and return Successful Response',
      () async {
    when(() =>
            changePasswordServiceMock.changePasswordEmail(sessionToken, any()))
        .thenAnswer((_) async {});

    final result = await datasource.changePasswordEmail(newPasswordModelMock);

    expect(result, SuccessfulResponse());
  });
}

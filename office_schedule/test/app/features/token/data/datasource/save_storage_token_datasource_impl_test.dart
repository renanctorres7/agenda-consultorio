import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/token/data/datasource/save_storage_token_datasource_impl.dart';

import '../../../../../mocks/mocks.dart';

void main() {
  final flutterSecureStorage = FlutterSecureStorageMock();
  final datasource = SaveStorageTokenDatasourceImpl(
      flutterSecureStorage: flutterSecureStorage);

  final key = faker.guid.guid();
  final value = faker.guid.guid();

  test('Should input a Key and a Value and returns a Successful Response',
      () async {
    when(() => flutterSecureStorage.write(key: key, value: value))
        .thenAnswer((_) async {});

    final result = await datasource.saveStorageToken(key: key, value: value);

    expect(result, SuccessfulResponse());
    verify(() => flutterSecureStorage.write(key: key, value: value)).called(1);
  });

  test('Should throw Exception if gets error', () async {
    when(() => flutterSecureStorage.write(key: key, value: value))
        .thenThrow(Exception());

    final result = datasource.saveStorageToken(key: key, value: value);

    expect(result, throwsA(const TypeMatcher<Exception>()));
    verify(() => flutterSecureStorage.write(key: key, value: value)).called(1);
  });
}

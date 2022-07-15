import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/external/local/secure_storage/token/read_storage_token_datasource_impl.dart';

import '../../../../../../mocks/mocks.dart';

void main() {
  final flutterSecureStorage = FlutterSecureStorageMock();
  final datasource = ReadStorageTokenDatasourceImpl(
      flutterSecureStorage: flutterSecureStorage);

  final key = faker.guid.guid();
  final value = faker.guid.guid();

  test('Should input a Key value and returns a String value', () async {
    when(() => flutterSecureStorage.read(key: key))
        .thenAnswer((_) async => value);

    final result = await datasource.readStorageToken(key: key);

    expect(result, const TypeMatcher<String>());
    verify(() => flutterSecureStorage.read(key: key)).called(1);
  });

  test(
      'Should input a Key value and returns a empty String value if Flutter Secure Storage returns null',
      () async {
    when(() => flutterSecureStorage.read(key: key))
        .thenAnswer((_) async => null);

    final result = await datasource.readStorageToken(key: key);

    expect(result, '');
    verify(() => flutterSecureStorage.read(key: key)).called(1);
  });

  test('Should throw Exception if gets error', () async {
    when(() => flutterSecureStorage.read(key: key)).thenThrow(Exception());

    final result = datasource.readStorageToken(key: key);

    expect(result, throwsA(const TypeMatcher<Exception>()));
    verify(() => flutterSecureStorage.read(key: key)).called(1);
  });
}

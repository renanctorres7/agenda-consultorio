import 'package:faker/faker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';
import 'package:office_schedule/app/features/external/local/secure_storage/token/delete_storage_token_datasource_impl.dart';

class FlutterSecureStorageMock extends Mock implements FlutterSecureStorage {}

void main() {
  final flutterSecureStorage = FlutterSecureStorageMock();
  final datasource = DeleteStorageTokenDatasourceImpl(
      flutterSecureStorage: flutterSecureStorage);

  final key = faker.guid.guid();

  test('Should input a Key value and returns a Successful Response', () async {
    when(() => flutterSecureStorage.delete(key: key)).thenAnswer((_) async {});

    final result = await datasource.deleteStorageToken(key: key);

    expect(result, SuccessfulResponse());
    verify(() => flutterSecureStorage.delete(key: key)).called(1);
  });

  test('Should throw Exception if gets error', () async {
    when(() => flutterSecureStorage.delete(key: key)).thenThrow(Exception());

    final result = datasource.deleteStorageToken(key: key);

    expect(result, throwsA(const TypeMatcher<Exception>()));
    verify(() => flutterSecureStorage.delete(key: key)).called(1);
  });
}

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/core.dart';
import 'package:office_schedule/app/features/external/external_hive/external_hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/foundation.dart' show kIsWeb;

class HiveBoxMock extends Mock implements Box {}

class HiveInterfaceMock extends Mock implements HiveInterface {}

void main() async {
  late HiveInterfaceMock hiveInterfaceMock;
  late HiveBoxMock hiveBoxMock;

  Future<void> initHive() async {
    if (!kIsWeb) {
      final pathDir = await path_provider.getApplicationDocumentsDirectory();
      Hive.init(pathDir.path);
    }

    Hive.registerAdapter<UserProfileHive>(UserProfileHiveAdapter());
  }

  setUp(() async {
    hiveInterfaceMock = HiveInterfaceMock();
    hiveBoxMock = HiveBoxMock();
  });

  final profile = UserProfileHive(
    email: faker.internet.email(),
    objectId: faker.guid.guid(),
    fullName: faker.person.name(),
    phone: faker.phoneNumber.us(),
    company: faker.company.name(),
    specialty: faker.company.position(),
  );

  await initHive();
  group('User Profile Database group test', () {
    test('Should save Use Profile Hive model value on User Profile database',
        () async {
      when(() => hiveInterfaceMock.openBox(DatabaseBoxName.dbUserProfile))
          .thenAnswer((_) async => hiveBoxMock);
      when(() => hiveBoxMock.put(0, profile)).thenAnswer((_) async => profile);
      final result = await UserProfileDatabase.saveUserProfile(profile);
      expect(result, profile);
    });
  });
}

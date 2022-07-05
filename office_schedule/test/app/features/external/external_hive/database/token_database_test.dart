import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/configs/configs.dart';
import 'package:office_schedule/app/features/external/external_hive/external_hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/foundation.dart' show kIsWeb;

class HiveBoxMock extends Mock implements Box {}

class HiveInterfaceMock extends Mock implements HiveInterface {}

void main() {
  late HiveInterfaceMock hiveInterfaceMock;
  late HiveBoxMock hiveBoxMock;

  Future<void> initHive() async {
    if (!kIsWeb) {
      final pathDir = await path_provider.getApplicationDocumentsDirectory();
      Hive.init(pathDir.path);
    }

    Hive.registerAdapter<TokenModelHive>(TokenModelHiveAdapter());
  }

  setUp(() async {
    await initHive();
    hiveInterfaceMock = HiveInterfaceMock();
    hiveBoxMock = HiveBoxMock();
  });

  //final db = Hive.box(DatabaseBoxName.dbToken);
  final token = TokenModelHive(token: faker.guid.guid());

  test('Should save the token model value on token database', () async {
    when(() => hiveInterfaceMock.openBox(DatabaseBoxName.dbToken))
        .thenAnswer((_) async => hiveBoxMock);
    when(() => hiveBoxMock.put(0, token)).thenAnswer((_) async => token);
    final result = await TokenDatabase.saveToken(token);

    expect(result, token);
  });
}

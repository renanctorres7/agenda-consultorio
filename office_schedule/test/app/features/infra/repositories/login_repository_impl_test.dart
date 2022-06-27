import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';
import 'package:office_schedule/app/features/infra/repositories/repositories.dart';

class LoginDatasourceImpl extends Mock implements LoginDatasource {}

void main() {
  final datasource = LoginDatasourceImpl();
  final repository = LoginRepositoryImpl(datasource);

  test("Should input a Login Entity and return a Sign Up Model", () async {});
}

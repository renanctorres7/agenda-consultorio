import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/schedules.dart';
import 'package:office_schedule/app/features/infra/repositories/schedules/schedules.dart';

class ListScheduleFilterDatasourceMock extends Mock
    implements ListScheduleFilterDatasource {}

void main() {
  final datasource = ListScheduleFilterDatasourceMock();
  final repository = ListScheduleFilterRepositoryImpl(datasource);

  test('Should input a Schedule Filter Model and returns a Schedule Model list',
      () async {});
}

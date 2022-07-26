import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/schedules/data/datasource/datasource.dart';
import 'package:office_schedule/app/features/schedules/data/service/service.dart';
import 'package:office_schedule/app/features/schedules/infra/models/models.dart';

import '../../../../../mocks/mocks.dart';

class ScheduleFilterServiceMock extends Mock implements ScheduleFilterService {}

class ScheduleFilterModelMock extends Mock implements ScheduleFilterModel {}

void main() {
  String token = faker.guid.guid();
  ScheduleFilterServiceMock scheduleFilterService = ScheduleFilterServiceMock();
  DioScheduleFilterDatasource datasource = DioScheduleFilterDatasource(
    scheduleFilterService: scheduleFilterService,
  );

  var scheduleFilterModelMock = ScheduleFilterModelMock();

  final scheduleFilterModel = MocksModels.scheduleFilterModel;

  final list = [MocksModels.scheduleModel];

  setUp(() {
    registerFallbackValue(token);
    registerFallbackValue(scheduleFilterModelMock);
    registerFallbackValue(scheduleFilterModel);

    registerFallbackValue(list);
  });

  test('When input a Schedule Filter Model should return a Schedule Model list',
      () async {
    when(() => scheduleFilterService.getListScheduleByFilter(any(), any()))
        .thenAnswer((_) async => list);

    final result =
        await datasource.getListScheduleByFilter(token, scheduleFilterModel);

    expect(result, list);
  });

  test(
      'When Schedule Filter Service gets null value should return a empty list from Datasource',
      () async {
    when(() => scheduleFilterService.getListScheduleByFilter(any(), any()))
        .thenAnswer((_) async => null);

    final result =
        await datasource.getListScheduleByFilter(token, scheduleFilterModel);

    expect(result, []);
  });

  test('Should throw a DioError if gets error', () async {
    when(() => scheduleFilterService.getListScheduleByFilter(any(), any()))
        .thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result =
        datasource.getListScheduleByFilter(token, scheduleFilterModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

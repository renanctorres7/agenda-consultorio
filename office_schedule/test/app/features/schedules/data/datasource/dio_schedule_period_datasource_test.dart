import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/schedules/data/datasource/datasource.dart';
import 'package:office_schedule/app/features/schedules/data/service/service.dart';
import 'package:office_schedule/app/features/schedules/infra/models/models.dart';

import '../../../../../mocks/mocks.dart';

class SchedulePeriodServiceMock extends Mock implements SchedulePeriodService {}

class SchedulePeriodModelMock extends Mock implements SchedulePeriodModel {}

void main() {
  String token = faker.guid.guid();
  SchedulePeriodServiceMock serviceMock = SchedulePeriodServiceMock();
  DioSchedulePeriodDatasource datasource =
      DioSchedulePeriodDatasource(schedulePeriodService: serviceMock);

  var schedulePeriodModelMock = SchedulePeriodModelMock();

  final schedulePeriodModel = MocksModels.schedulePeriodModel;

  final list = [MocksModels.scheduleModel];

  setUp(() {
    registerFallbackValue(token);
    registerFallbackValue(schedulePeriodModelMock);
    registerFallbackValue(schedulePeriodModel);

    registerFallbackValue(list);
  });

  test('When input a Schedule Period Model should return a Schedule Model list',
      () async {
    when(() => serviceMock.getScheduleListByPeriod(any(), any()))
        .thenAnswer((_) async => list);

    final result =
        await datasource.getScheduleListByPeriod(token, schedulePeriodModel);

    expect(result, list);
  });

  test(
      'When Schedule Period Service gets null value should return a empty list from Datasource',
      () async {
    when(() => serviceMock.getScheduleListByPeriod(any(), any()))
        .thenAnswer((_) async => null);

    final result =
        await datasource.getScheduleListByPeriod(token, schedulePeriodModel);

    expect(result, []);
  });

  test('Should throw a DioException if gets error', () async {
    when(() => serviceMock.getScheduleListByPeriod(any(), any()))
        .thenThrow(DioException(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result =
        datasource.getScheduleListByPeriod(token, schedulePeriodModel);

    expect(result, throwsA(const TypeMatcher<DioException>()));
  });
}

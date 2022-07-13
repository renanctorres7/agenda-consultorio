import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/external/external.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../../../../../mocks/mocks.dart';

class SchedulePeriodServiceMock extends Mock implements SchedulePeriodService {}

class SchedulePeriodModelMock extends Mock implements SchedulePeriodModel {}

void main() {
  String sessionToken = faker.guid.guid();
  SchedulePeriodServiceMock serviceMock = SchedulePeriodServiceMock();
  DioSchedulePeriodDatasource datasource = DioSchedulePeriodDatasource(
      schedulePeriodService: serviceMock, sessionToken: sessionToken);

  var schedulePeriodModelMock = SchedulePeriodModelMock();

  final schedulePeriodModel = MocksModels.schedulePeriodModel;

  final list = [MocksModels.scheduleModel];

  setUp(() {
    registerFallbackValue(sessionToken);
    registerFallbackValue(schedulePeriodModelMock);
    registerFallbackValue(schedulePeriodModel);

    registerFallbackValue(list);
  });

  test('When input a Schedule Period Model should return a Schedule Model list',
      () async {
    when(() => serviceMock.getScheduleListByPeriod(any(), any()))
        .thenAnswer((_) async => list);

    final result =
        await datasource.getScheduleListByPeriod(schedulePeriodModel);

    expect(result, list);
  });

  test('Should throw a DioError if gets error', () async {
    when(() => serviceMock.getScheduleListByPeriod(any(), any()))
        .thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.getScheduleListByPeriod(schedulePeriodModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

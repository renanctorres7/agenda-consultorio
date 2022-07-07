import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/external/external_dio/datasource/schedule/dio_create_schedule_datasource.dart';
import 'package:office_schedule/app/features/external/external_dio/service/schedule/create_schedule_service.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../../../../mocks/mocks.dart';

class CreateScheduleServiceMock extends Mock implements CreateScheduleService {}

class ScheduleCreateModelMock extends Mock implements ScheduleCreateModel {}

void main() {
  String sessionToken = faker.guid.guid();
  CreateScheduleServiceMock service = CreateScheduleServiceMock();
  DioCreateScheduleDatasource datasource = DioCreateScheduleDatasource(
      createScheduleService: service, sessionToken: sessionToken);

  final scheduleCreateModel = MocksModels.scheduleCreateModel;
  final modelMock = ScheduleCreateModelMock();

  setUp(() {
    registerFallbackValue(modelMock);

    registerFallbackValue(scheduleCreateModel);
    registerFallbackValue(sessionToken);
  });

  test('When input a Create Schedule Model should return a Successful Response',
      () async {
    when(() => service.createSchedule(any(), any())).thenAnswer((_) async {});

    final result = await datasource.createSchedule(scheduleCreateModel);

    expect(result, SuccessfulResponse());
  });

  test('Should return DataSource Error if gets error', () async {
    when(() => service.createSchedule(any(), any())).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.createSchedule(scheduleCreateModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

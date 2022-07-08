import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';
import 'package:office_schedule/app/features/external/external_dio/datasource/schedule/dio_update_schedule_datasource.dart';
import 'package:office_schedule/app/features/external/external_dio/service/schedule/update_schedule_service.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../../../../mocks/mocks_models.dart';

class UpdateScheduleServiceMock extends Mock implements UpdateScheduleService {}

class ScheduleUpdateModelMock extends Mock implements ScheduleUpdateModel {}

void main() {
  String sessionToken = faker.guid.guid();
  final updateScheduleService = UpdateScheduleServiceMock();

  final datasource = DioUpdateScheduleDatasource(
      updateScheduleService: updateScheduleService, sessionToken: sessionToken);

  final scheduleUpdateModel = MocksModels.scheduleUpdateModel;
  final scheduleUpdateModelMock = ScheduleUpdateModelMock();

  setUp(() {
    registerFallbackValue(sessionToken);
    registerFallbackValue(scheduleUpdateModel);
    registerFallbackValue(scheduleUpdateModelMock);
  });

  test('Should input an Schedule Update Model and return a Successful Response',
      () async {
    when(() => updateScheduleService.updateSchedule(any(), any()))
        .thenAnswer((_) async {});

    final result = await datasource.updateSchedule(scheduleUpdateModel);

    expect(result, SuccessfulResponse());
    verify(() => updateScheduleService.updateSchedule(any(), any())).called(1);
  });

  test('Should throw a DioError when gets error', () async {
    when(() => updateScheduleService.updateSchedule(any(), any()))
        .thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.updateSchedule(scheduleUpdateModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
    verify(() => updateScheduleService.updateSchedule(any(), any())).called(1);
  });
}

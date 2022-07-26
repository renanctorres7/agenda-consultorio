import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/external/external.dart';

import '../../../../../../../mocks/mocks.dart';

class GetScheduleServiceMock extends Mock implements GetScheduleService {}

void main() {
  String token = faker.guid.guid();
  final service = GetScheduleServiceMock();
  final datasource = DioGetScheduleDatasource(getScheduleService: service);
  final objectId = faker.guid.guid();
  final scheduleModel = MocksModels.scheduleModel;

  Map<String, String> mapObjectId = {'objectId': objectId};
  test('Input a token and a Object ID and returns Schedule Model', () async {
    when(() => service.getSchedule(token, mapObjectId))
        .thenAnswer((_) async => scheduleModel);

    final result =
        await datasource.getSchedule(token: token, objectId: objectId);

    expect(result, scheduleModel);
  });

  test('Should throw a Dio Error if gets error', () async {
    when(() => service.getSchedule(token, mapObjectId)).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.getSchedule(token: token, objectId: objectId);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

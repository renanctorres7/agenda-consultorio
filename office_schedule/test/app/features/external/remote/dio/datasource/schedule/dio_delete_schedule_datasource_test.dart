import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/external/external.dart';

class DeleteScheduleServiceMock extends Mock implements DeleteScheduleService {}

void main() {
  String token = faker.guid.guid();
  String objectId = faker.guid.guid();
  DeleteScheduleServiceMock serviceMock = DeleteScheduleServiceMock();
  DioDeleteScheduleDatasource datasource = DioDeleteScheduleDatasource(
    deleteScheduleService: serviceMock,
  );

  setUp(() {
    registerFallbackValue(token);
    registerFallbackValue(objectId);
  });

  Map<String, String> objectIdMap = {'objectId': objectId};

  test('When input a objectId should return Successful Response', () async {
    when(() => serviceMock.deleteSchedule(token, objectIdMap))
        .thenAnswer((_) async {});

    final result = await datasource.deleteSchedule(token, objectId);

    expect(result, SuccessfulResponse());

    verify(() => serviceMock.deleteSchedule(token, objectIdMap)).called(1);
  });

  test('Should throw a DioError if gets error', () async {
    when(() => serviceMock.deleteSchedule(token, objectIdMap))
        .thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.deleteSchedule(token, objectId);

    expect(result, throwsA(const TypeMatcher<DioError>()));

    verify(() => serviceMock.deleteSchedule(token, objectIdMap)).called(1);
  });
}

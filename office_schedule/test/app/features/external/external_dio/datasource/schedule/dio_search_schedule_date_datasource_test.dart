import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/external/external_dio/datasource/schedule/dio_search_schedule_date_datasource.dart';
import 'package:office_schedule/app/features/external/external_dio/service/schedule/schedule.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../../../../mocks/mocks.dart';

class SearchScheduleDateServiceMock extends Mock
    implements SearchScheduleDateService {}

class ScheduleDateModelMock extends Mock implements ScheduleDateModel {}

void main() {
  String sessionToken = faker.guid.guid();
  final searchScheduleDateService = SearchScheduleDateServiceMock();
  final datasource = DioSearchScheduleDateDatasource(
      searchScheduleDateService: searchScheduleDateService,
      sessionToken: sessionToken);

  var scheduleDateModelMock = ScheduleDateModelMock();

  final scheduleDateModel = MocksModels.scheduleDateModel;

  final list = [MocksModels.scheduleModel];

  setUp(() {
    registerFallbackValue(sessionToken);
    registerFallbackValue(scheduleDateModelMock);
    registerFallbackValue(scheduleDateModel);

    registerFallbackValue(list);
  });

  test('When input a Schedule Date Model should return a Schedule Model list',
      () async {
    when(() => searchScheduleDateService.searchScheduleFromDate(any(), any()))
        .thenAnswer((_) async => list);

    final result = await datasource.searchScheduleFromDate(scheduleDateModel);

    expect(result, list);
  });

  test('Should throw a DioError if gets error', () async {
    when(() => searchScheduleDateService.searchScheduleFromDate(any(), any()))
        .thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.searchScheduleFromDate(scheduleDateModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

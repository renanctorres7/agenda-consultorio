import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/external/external.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

import '../../../../../../../mocks/mocks.dart';

class SearchScheduleDateServiceMock extends Mock
    implements SearchScheduleDateService {}

class ScheduleDateModelMock extends Mock implements ScheduleDateModel {}

void main() {
  String token = faker.guid.guid();
  final searchScheduleDateService = SearchScheduleDateServiceMock();
  final datasource = DioSearchScheduleDateDatasource(
      searchScheduleDateService: searchScheduleDateService);

  var scheduleDateModelMock = ScheduleDateModelMock();

  final scheduleDateModel = MocksModels.scheduleDateModel;

  final list = [MocksModels.scheduleModel];

  setUp(() {
    registerFallbackValue(token);
    registerFallbackValue(scheduleDateModelMock);
    registerFallbackValue(scheduleDateModel);

    registerFallbackValue(list);
  });

  test('When input a Schedule Date Model should return a Schedule Model list',
      () async {
    when(() => searchScheduleDateService.searchScheduleFromDate(any(), any()))
        .thenAnswer((_) async => list);

    final result =
        await datasource.searchScheduleFromDate(token, scheduleDateModel);

    expect(result, list);
  });

  test(
      'When Search Schedule Date Service gets null value should return a empty list from Datasource',
      () async {
    when(() => searchScheduleDateService.searchScheduleFromDate(any(), any()))
        .thenAnswer((_) async => null);

    final result =
        await datasource.searchScheduleFromDate(token, scheduleDateModel);

    expect(result, []);
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

    final result = datasource.searchScheduleFromDate(token, scheduleDateModel);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

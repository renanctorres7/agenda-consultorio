import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/clients/data/datasource/datasource.dart';
import 'package:office_schedule/app/features/clients/data/service/service.dart';
import 'package:office_schedule/app/features/clients/infra/models/models.dart';

import '../../../../../mocks/mocks.dart';

class GetClientsListServiceMock extends Mock implements GetClientsListService {}

void main() {
  final token = MocksModels.token;
  final service = GetClientsListServiceMock();
  final datasource =
      DioGetClientsListDatasource(getClientsListService: service);
  final list = <ClientsListModel>[];

  setUp(() {
    registerFallbackValue(token);
    registerFallbackValue(list);
  });

  test('Should input a Token and returns a List of Clients List Model',
      () async {
    when(() => service.getClientsList(token)).thenAnswer((_) async => list);

    final result = await datasource.getClientsList(token: token);

    expect(result, list);
  });

  test('Should return DataSource Error if gets error', () async {
    when(() => service.getClientsList(token)).thenThrow(DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        data: 'Something went wrong',
        statusCode: 404,
        requestOptions: RequestOptions(path: ''),
      ),
    ));

    final result = datasource.getClientsList(token: token);

    expect(result, throwsA(const TypeMatcher<DioError>()));
  });
}

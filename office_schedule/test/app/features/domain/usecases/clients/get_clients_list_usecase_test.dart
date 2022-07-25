import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/clients/clients.dart';
import 'package:office_schedule/app/features/domain/usecases/clients/clients.dart';

import '../../../../../mocks/mocks.dart';

class GetClientsListRepositoryMock extends Mock
    implements GetClientsListRepository {}

void main() {
  final token = MocksModels.token;

  final repository = GetClientsListRepositoryMock();
  final usecase = GetClientsListUsecaseImpl(repository);

  final list = <ClientsListEntityMock>[];

  test('Should input a Token and return a Clients List Entity', () async {
    when(() => repository.getClientsList(token: token))
        .thenAnswer((_) async => Right(list));

    final result = await usecase(token: token);

    expect(result, Right(list));

    verify(() => repository.getClientsList(token: token)).called(1);
  });

  test('Should return a Domain Error if gets error', () async {
    when(() => repository.getClientsList(token: token))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token: token);

    expect(result, Left(DomainError()));

    verify(() => repository.getClientsList(token: token)).called(1);
  });
}

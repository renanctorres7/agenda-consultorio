import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/clients/clients.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/domain/usecases/clients/clients_update_usecase.dart';

import '../../../../../mocks/mocks.dart';

class ClientsUpdateRepositoryMock extends Mock
    implements ClientsUpdateRepository {}

void main() {
  String token = faker.guid.guid();
  final repository = ClientsUpdateRepositoryMock();
  final usecase = ClientsUpdateUsecaseImpl(repository);
  final clientsUpdateEntityMock = ClientsUpdateEntityMock();
  test(
      'Should input an Clients Update Entity and return a Successful Response ',
      () async {
    when(() => repository.updateClient(
            token: token, clientsUpdateEntity: clientsUpdateEntityMock))
        .thenAnswer((_) async => Right(SuccessfulResponse()));

    final result = await usecase(
        token: token, clientsUpdateEntity: clientsUpdateEntityMock);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.updateClient(
        token: token, clientsUpdateEntity: clientsUpdateEntityMock)).called(1);
  });

  test('Should return a Domain Error if gets error ', () async {
    when(() => repository.updateClient(
            token: token, clientsUpdateEntity: clientsUpdateEntityMock))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(
        token: token, clientsUpdateEntity: clientsUpdateEntityMock);

    expect(result, Left(DomainError()));

    verify(() => repository.updateClient(
        token: token, clientsUpdateEntity: clientsUpdateEntityMock)).called(1);
  });
}

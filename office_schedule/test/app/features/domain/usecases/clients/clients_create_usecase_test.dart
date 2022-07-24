import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/clients/clients_create_repository.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/domain/usecases/clients/clients.dart';

import '../../../../../mocks/mocks.dart';

class ClientsCreateRepositoryMock extends Mock
    implements ClientsCreateRepository {}

void main() {
  String token = faker.guid.guid();
  final repository = ClientsCreateRepositoryMock();
  final usecase = ClientsCreateUsecaseImpl(repository);
  final clientsCreateEntityMock = ClientsCreateEntityMock();
  test(
      'Should input an Clients Create Entity and return a Successful Response ',
      () async {
    when(() => repository.createClient(
            token: token, clientsCreateEntity: clientsCreateEntityMock))
        .thenAnswer((_) async => Right(SuccessfulResponse()));

    final result = await usecase(
        token: token, clientsCreateEntity: clientsCreateEntityMock);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.createClient(
        token: token, clientsCreateEntity: clientsCreateEntityMock)).called(1);
  });

  test('Should return a Domain Error if gets error ', () async {
    when(() => repository.createClient(
            token: token, clientsCreateEntity: clientsCreateEntityMock))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(
        token: token, clientsCreateEntity: clientsCreateEntityMock);

    expect(result, Left(DomainError()));

    verify(() => repository.createClient(
        token: token, clientsCreateEntity: clientsCreateEntityMock)).called(1);
  });
}

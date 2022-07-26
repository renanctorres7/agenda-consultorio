import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/errors/errors.dart';
import 'package:office_schedule/app/features/domain/repositories/clients/clients.dart';
import 'package:office_schedule/app/features/domain/success/success.dart';
import 'package:office_schedule/app/features/domain/usecases/clients/delete_client_usecase.dart';

import '../../../../../mocks/mocks.dart';

class DeleteClientRepositoryMock extends Mock
    implements DeleteClientRepository {}

void main() {
  final token = MocksModels.token;
  final objectId = MocksModels.objectId;

  final repository = DeleteClientRepositoryMock();
  final usecase = DeleteClientUsecaseImpl(repository);

  test('Should input a ObjectId and a Token and returns a Successful Response',
      () async {
    when(() => repository.deleteClient(token: token, objectId: objectId))
        .thenAnswer((_) async => Right(SuccessfulResponse()));

    final result = await usecase(token: token, objectId: objectId);

    expect(result, Right(SuccessfulResponse()));

    verify(() => repository.deleteClient(token: token, objectId: objectId))
        .called(1);
  });

  test('Should return a Domain Error if gets error', () async {
    when(() => repository.deleteClient(token: token, objectId: objectId))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token: token, objectId: objectId);

    expect(result, Left(DomainError()));

    verify(() => repository.deleteClient(token: token, objectId: objectId))
        .called(1);
  });
}

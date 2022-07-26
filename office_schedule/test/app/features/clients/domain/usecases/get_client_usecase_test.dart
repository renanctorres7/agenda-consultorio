import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/core/errors/errors.dart';
import 'package:office_schedule/app/core/success/success.dart';
import 'package:office_schedule/app/features/clients/domain/repository/repository.dart';
import 'package:office_schedule/app/features/clients/domain/usecases/usecases.dart';

import '../../../../../mocks/mocks.dart';

class GetClientRepositoryMock extends Mock implements GetClientRepository {}

void main() {
  final token = MocksModels.token;
  final objectId = MocksModels.objectId;

  final repository = GetClientRepositoryMock();
  final usecase = GetClientUsecaseImpl(repository);

  final entity = ClientsEntityMock();

  test('Should input a String ObjectId and return a Client Entity', () async {
    when(() => repository.getClient(token: token, objectId: objectId))
        .thenAnswer((_) async => Right(entity));

    final result = await usecase(token: token, objectId: objectId);

    expect(result, Right(entity));

    verify(() => repository.getClient(token: token, objectId: objectId))
        .called(1);
  });

  test('Should return a Domain Error if gets error', () async {
    when(() => repository.getClient(token: token, objectId: objectId))
        .thenAnswer((_) async => Left(DomainError()));

    final result = await usecase(token: token, objectId: objectId);

    expect(result, Left(DomainError()));

    verify(() => repository.getClient(token: token, objectId: objectId))
        .called(1);
  });
}

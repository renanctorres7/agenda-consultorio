import 'package:dartz/dartz.dart';

import '../../../errors/errors.dart';
import '../../../repositories/respositories.dart';
import '../../../success/success.dart';

abstract class DeleteStorageTokenUsecase {
  Future<Either<FailureError, Success>> call(
      {required String key, required String value});
}

class DeleteStorageTokenUsecaseImpl implements DeleteStorageTokenUsecase {
  final DeleteStorageTokenRepository repository;

  DeleteStorageTokenUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      {required String key, required String value}) async {
    final result = await repository.deleteStorageToken(key: key, value: value);
    return result;
  }
}

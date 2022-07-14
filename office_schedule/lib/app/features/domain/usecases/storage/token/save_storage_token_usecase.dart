import 'package:dartz/dartz.dart';

import '../../../errors/errors.dart';
import '../../../success/success.dart';
import '../../../repositories/respositories.dart';

abstract class SaveStorageTokenUsecase {
  Future<Either<FailureError, Success>> call(
      {required String key, required String value});
}

class SaveStorageTokenUsecaseImpl implements SaveStorageTokenUsecase {
  final SaveStorageTokenRepository repository;

  SaveStorageTokenUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      {required String key, required String value}) async {
    final result = await repository.saveStorageToken(key: key, value: value);
    return result;
  }
}

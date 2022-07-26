import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../repository/repository.dart';

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

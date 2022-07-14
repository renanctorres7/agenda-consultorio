import 'package:dartz/dartz.dart';

import '../../../errors/errors.dart';
import '../../../success/success.dart';
import '../../../repositories/respositories.dart';

abstract class ReadStorageTokenUsecase {
  Future<Either<FailureError, Success>> call({required String key});
}

class ReadStorageTokenUsecaseImpl implements ReadStorageTokenUsecase {
  final ReadStorageTokenRepository repository;

  ReadStorageTokenUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call({required String key}) async {
    final result = await repository.readStorageToken(key: key);
    return result;
  }
}

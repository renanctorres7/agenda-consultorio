import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../repository/repository.dart';

abstract class DeleteStorageTokenUsecase {
  Future<Either<FailureError, Success>> call({required String key});
}

class DeleteStorageTokenUsecaseImpl implements DeleteStorageTokenUsecase {
  final DeleteStorageTokenRepository repository;

  DeleteStorageTokenUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call({required String key}) async {
    final result = await repository.deleteStorageToken(key: key);
    return result;
  }
}

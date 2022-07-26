import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../repository/repository.dart';

abstract class ReadStorageTokenUsecase {
  Future<Either<FailureError, String>> call({required String key});
}

class ReadStorageTokenUsecaseImpl implements ReadStorageTokenUsecase {
  final ReadStorageTokenRepository repository;

  ReadStorageTokenUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, String>> call({required String key}) async {
    final result = await repository.readStorageToken(key: key);
    return result;
  }
}

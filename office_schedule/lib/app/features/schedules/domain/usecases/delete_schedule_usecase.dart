import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../repository/repository.dart';

abstract class DeleteScheduleUsecase {
  Future<Either<FailureError, Success>> call(String token, String objectId);
}

class DeleteScheduleUsecaseImpl implements DeleteScheduleUsecase {
  final DeleteScheduleRepository repository;

  DeleteScheduleUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(
      String token, String objectId) async {
    final result = await repository.deleteSchedule(token, objectId);
    return result;
  }
}

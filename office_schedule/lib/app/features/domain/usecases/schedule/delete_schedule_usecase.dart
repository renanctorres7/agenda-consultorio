import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

import '../../errors/errors.dart';
import '../../success/success.dart';

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

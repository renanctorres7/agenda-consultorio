import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';

import '../../errors/errors.dart';
import '../../success/success.dart';

abstract class DeleteScheduleUsecase {
  Future<Either<FailureError, Success>> call(String objectId);
}

class DeleteScheduleUsecaseImpl implements DeleteScheduleUsecase {
  final DeleteScheduleRepository repository;

  DeleteScheduleUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, Success>> call(String objectId) async {
    final result = await repository.deleteSchedule(objectId);
    return result;
  }
}

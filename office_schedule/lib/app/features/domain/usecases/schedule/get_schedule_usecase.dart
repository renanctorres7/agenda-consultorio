import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_entity.dart';

import '../../errors/errors.dart';
import '../../repositories/respositories.dart';

abstract class GetScheduleUsecase {
  Future<Either<FailureError, ScheduleEntity>> call({required String objectId});
}

class GetScheduleUsecaseImpl implements GetScheduleUsecase {
  final GetScheduleRepository repository;

  GetScheduleUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, ScheduleEntity>> call(
      {required String objectId}) async {
    final result = await repository.getSchedule(objectId: objectId);
    return result;
  }
}

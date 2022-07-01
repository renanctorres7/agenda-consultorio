import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_update_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';

class UpdateScheduleRepositoryImpl extends UpdateScheduleRepository {
  @override
  Future<Either<FailureError, Success>> updateSchedule(
      ScheduleUpdateEntity scheduleUpdateEntity) {
    // TODO: implement updateSchedule
    throw UnimplementedError();
  }
}

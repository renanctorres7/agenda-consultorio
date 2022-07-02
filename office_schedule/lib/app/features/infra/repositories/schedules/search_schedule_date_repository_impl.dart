import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:office_schedule/app/features/domain/entities/schedules/schedule_entity.dart';

import 'package:office_schedule/app/features/domain/entities/schedules/schedule_date_entity.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/repositories/respositories.dart';

class SearchScheduleDateRepositoryImpl implements SearchScheduleDateRepository {
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> searchScheduleFromDate(
      ScheduleDateEntity scheduleDateEntity) {
    // TODO: implement searchScheduleFromDate
    throw UnimplementedError();
  }
}

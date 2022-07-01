import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/schedule/schedule.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class SearchScheduleDateUsecase {
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      ScheduleDateEntity scheduleDateEntity);
}

class SearchScheduleDateUsecaseMock extends SearchScheduleDateUsecase {
  final SearchScheduleDateRepository repository;

  SearchScheduleDateUsecaseMock(this.repository);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      ScheduleDateEntity scheduleDateEntity) async {
    final result = await repository.searchScheduleFromDate(scheduleDateEntity);
    return result;
  }
}

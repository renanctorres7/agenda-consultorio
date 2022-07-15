import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/schedule/schedule.dart';

import '../../entities/entities.dart';
import '../../errors/errors.dart';

abstract class SearchScheduleDateUsecase {
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      String token, ScheduleDateEntity scheduleDateEntity);
}

class SearchScheduleDateUsecaseImpl implements SearchScheduleDateUsecase {
  final SearchScheduleDateRepository repository;

  SearchScheduleDateUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> call(
      String token, ScheduleDateEntity scheduleDateEntity) async {
    final result =
        await repository.searchScheduleFromDate(token, scheduleDateEntity);
    return result;
  }
}

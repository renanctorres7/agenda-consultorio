import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/entities.dart';
import '../repository/repository.dart';

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

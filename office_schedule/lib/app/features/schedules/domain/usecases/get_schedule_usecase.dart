import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';

import '../entities/entities.dart';
import '../repository/repository.dart';

abstract class GetScheduleUsecase {
  Future<Either<FailureError, ScheduleEntity>> call(
      {required String token, required String objectId});
}

class GetScheduleUsecaseImpl implements GetScheduleUsecase {
  final GetScheduleRepository repository;

  GetScheduleUsecaseImpl(this.repository);
  @override
  Future<Either<FailureError, ScheduleEntity>> call(
      {required String token, required String objectId}) async {
    final result =
        await repository.getSchedule(objectId: objectId, token: token);
    return result;
  }
}

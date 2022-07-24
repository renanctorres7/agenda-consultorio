import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/schedule/get_schedule_repository.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';

class GetScheduleRepositoryImpl implements GetScheduleRepository {
  final GetScheduleDatasource datasource;

  GetScheduleRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, ScheduleEntity>> getSchedule(
      {required String objectId}) async {
    try {
      final result = await datasource.getSchedule(objectId: objectId);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}

import 'package:office_schedule/app/features/domain/success/successful_response.dart';

import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/delete_schedule_datasource.dart';

import '../../../domain/repositories/respositories.dart';

class DeleteScheduleRepositoryImpl implements DeleteScheduleRepository {
  final DeleteScheduleDatasource datasource;

  DeleteScheduleRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> deleteSchedule(
      String token, String objectId) async {
    try {
      final result = await datasource.deleteSchedule(token, objectId);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}

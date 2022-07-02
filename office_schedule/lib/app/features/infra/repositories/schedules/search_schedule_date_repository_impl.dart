import 'package:office_schedule/app/features/domain/errors/failure_error.dart';

import 'package:office_schedule/app/features/domain/entities/schedules/schedule_entity.dart';

import 'package:office_schedule/app/features/domain/entities/schedules/schedule_date_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/schedules.dart';

import '../../../domain/repositories/respositories.dart';

class SearchScheduleDateRepositoryImpl implements SearchScheduleDateRepository {
  final SearchScheduleDateDatasource datasource;

  SearchScheduleDateRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> searchScheduleFromDate(
      ScheduleDateEntity scheduleDateEntity) async {
    try {
      final result =
          await datasource.searchScheduleFromDate(scheduleDateEntity);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}

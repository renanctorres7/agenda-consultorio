import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';
import '../../datasources/schedules/schedules.dart';

class ListScheduleFilterRepositoryImpl extends ListScheduleFilterRepository {
  final ListScheduleFilterDatasource datasource;

  ListScheduleFilterRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> getListScheduleByFilter(
      ScheduleFilterEntity scheduleFilterEntity) async {
    try {
      final result =
          await datasource.getListScheduleByFilter(scheduleFilterEntity);

      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
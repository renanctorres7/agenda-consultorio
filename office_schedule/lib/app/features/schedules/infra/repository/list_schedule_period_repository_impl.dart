import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasource.dart';
import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';

class ListSchedulePeriodRepositoryImpl implements ListSchedulePeriodRepository {
  final ListSchedulePeriodDatasource datasource;

  ListSchedulePeriodRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> getScheduleListByPeriod(
      String token, SchedulePeriodEntity schedulePeriodEntity) async {
    try {
      final result =
          await datasource.getScheduleListByPeriod(token, schedulePeriodEntity);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}

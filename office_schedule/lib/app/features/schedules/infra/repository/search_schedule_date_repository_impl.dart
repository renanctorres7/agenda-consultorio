import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasource.dart';

class SearchScheduleDateRepositoryImpl implements SearchScheduleDateRepository {
  final SearchScheduleDateDatasource datasource;

  SearchScheduleDateRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, List<ScheduleEntity>>> searchScheduleFromDate(
      String token, ScheduleDateEntity scheduleDateEntity) async {
    try {
      final result =
          await datasource.searchScheduleFromDate(token, scheduleDateEntity);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}

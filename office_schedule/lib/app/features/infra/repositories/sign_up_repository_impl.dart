import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/respositories.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDatasource datasource;

  SignUpRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, SignUpEntity>> signUp(SignUpEntity params) async {
    try {
      final result = await datasource.signUp(SignUpModel.fromEntity(params));
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      throw Left(DataSourceError());
    }
  }
}

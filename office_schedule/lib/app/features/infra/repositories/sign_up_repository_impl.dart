import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/sign_up_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/infra/models/sign_up/sign_up_model.dart';

import '../datasources/datasources.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDatasource datasource;
  @override
  Future<Either<FailureError, SignUpEntity>> signUp(SignUpEntity params) async {
    try {
      final result = await datasource.signUp(SignUpModel.fromEntity(params));
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {}
  }
}

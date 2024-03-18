import 'package:dartz/dartz.dart';

import 'package:office_schedule/app/core/errors/failure_error.dart';
import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/domain/repository/sign_up_repository.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/sign_up_datasource.dart';
import 'package:office_schedule/app/features/auth/infra/models/models.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDatasource datasource;

  SignUpRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, SignUpEntity>> signUp(SignUpEntity params) async {
    try {
      SignUpModel? signUpModel;
      String? errorMessage;
      await datasource.signUp(params, (response) {
        signUpModel = response;
      }, (error) {
        errorMessage = error;
      });
      if (signUpModel != null) {
        return Right(signUpModel!);
      } else {
        return Left(DataSourceError(errorMessage));
      }
    } catch (e) {
      return Left(DataSourceError('SIGNUP REPOSITORY IMPL ERROR'));
    }
  }
}

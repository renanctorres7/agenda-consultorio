import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/auth/domain/entities/entities.dart';
import 'package:office_schedule/app/features/auth/domain/repository/change_password_repository.dart';
import 'package:office_schedule/app/features/auth/domain/repository/reset_password_repository.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/change_password_datasource.dart';
import 'package:office_schedule/app/features/auth/infra/datasources/reset_password_datasource.dart';
import 'package:office_schedule/app/features/clients/domain/entities/entities.dart';
import 'package:office_schedule/app/features/profile/domain/entities/user_update_entity.dart';
import 'package:office_schedule/app/features/profile/infra/datasources/update_profile_datasource.dart';
import 'package:office_schedule/app/features/profile/infra/models/user_update_model.dart';
import 'package:office_schedule/app/features/schedules/domain/entities/entities.dart';
import 'package:office_schedule/app/features/schedules/domain/repository/repository.dart';
import 'package:office_schedule/app/features/users/domain/entities/user_entity.dart';
import 'package:office_schedule/app/features/users/domain/repository/repository.dart';
import 'package:office_schedule/app/features/users/infra/datasources/datasources.dart';

class LoginEntityMock extends Mock implements LoginEntity {}

class SignUpEntityMock extends Mock implements SignUpEntity {}

class UpdateProfileDatasourceMock extends Mock
    implements UpdateProfileDatasource {}

class UserUpdateEntityMock extends Mock implements UserUpdateEntity {}

class ChangePasswordRepositoryMock extends Mock
    implements ChangePasswordRepository {}

class NewPasswordEntityMock extends Mock implements NewPasswordEntity {}

class ChangePasswordDatasourceMock extends Mock
    implements ChangePasswordDatasource {}

class ResetPasswordRepositoryMock extends Mock
    implements ResetPasswordRepository {}

class ResetPasswordDatasourceMock extends Mock
    implements ResetPasswordDatasource {}

class UsersEntityMock extends Mock implements UserEntity {}

class GetUserRepositoryMock extends Mock implements GetUserRepository {}

class GetUserDatasourceMock extends Mock implements GetUserDatasource {}

class UsersListRepositoryMock extends Mock implements UsersListRepository {}

class UsersListDatasourceMock extends Mock implements UsersListDatasource {}

class CreateScheduleRepositoryMock extends Mock
    implements CreateScheduleRepository {}

class ScheduleCreateEntityMock extends Mock implements ScheduleCreateEntity {}

class UserUpdateModelMock extends Mock implements UserUpdateModel {}

class FlutterSecureStorageMock extends Mock implements FlutterSecureStorage {}

class ClientsCreateEntityMock extends Mock implements ClientsCreateEntity {}

class ClientsUpdateEntityMock extends Mock implements ClientsUpdateEntity {}

class ClientsEntityMock extends Mock implements ClientsEntity {}

class ClientsListEntityMock extends Mock implements ClientsListEntity {}

import 'package:mocktail/mocktail.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/infra/datasources/datasources.dart';

class LoginEntityMock extends Mock implements LoginEntity {}

class SignUpEntityMock extends Mock implements SignUpEntity {}

class UpdateProfileDatasourceMock extends Mock
    implements UpdateProfileDatasource {}

class ChangePasswordRepositoryMock extends Mock
    implements ChangePasswordRepository {}

class NewPasswordEntityMock extends Mock implements NewPasswordEntity {}

class ChangePasswordDatasourceMock extends Mock
    implements ChangePasswordDatasource {}

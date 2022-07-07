import 'package:faker/faker.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

class MocksModels {
  static final signUpModel = SignUpModel(
      email: faker.internet.email(),
      password: faker.internet.password(),
      fullName: faker.person.name(),
      phone: faker.phoneNumber.us(),
      company: faker.company.name(),
      specialty: faker.company.position(),
      token: "",
      objectId: "");

  static final newPasswordModel = NewPasswordModel(
    currentEmail: faker.internet.email(),
    newEmail: faker.internet.email(),
    currentPassword: faker.internet.password(),
    newPassword: faker.internet.password(),
  );

  static final usersModel = UsersModel(
      email: faker.internet.email(),
      password: faker.internet.password(),
      fullName: faker.person.name(),
      phone: faker.phoneNumber.us(),
      company: faker.company.name(),
      specialty: faker.company.position(),
      token: "",
      objectId: "");

  static final scheduleCreateModel = ScheduleCreateModel(
      datetime: "datetime",
      client: "client",
      typePayment: "typePayment",
      paymentStatus: "paymentStatus",
      scheduleStatus: "scheduleStatus",
      description: "");

  static final scheduleUpdateModel = ScheduleUpdateModel(objectId: '');

  static final loginModel = LoginModel(
      email: faker.internet.email(), password: faker.internet.password());

  static final scheduleFilterModel = ScheduleFilterModel(
    page: 0,
    period: 7,
  );

  static final scheduleModel = ScheduleModel(
      objectId: 'objectId',
      datetime: 'datetime',
      client: 'client',
      modifiedByModel: usersModel,
      userModel: usersModel,
      typePayment: 'typePayment',
      paymentStatus: 'paymentStatus',
      scheduleStatus: 'scheduleStatus',
      createdAt: 'createdAt',
      updatedAt: 'updatedAt');

  static final schedulePeriodModel = SchedulePeriodModel(page: 7, period: 0);
}

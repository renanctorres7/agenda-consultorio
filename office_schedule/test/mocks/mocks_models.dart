import 'package:faker/faker.dart';
import 'package:office_schedule/app/features/auth/infra/models/models.dart';
import 'package:office_schedule/app/features/clients/infra/models/models.dart';
import 'package:office_schedule/app/features/profile/infra/models/user_update_model.dart';
import 'package:office_schedule/app/features/schedules/infra/models/models.dart';
import 'package:office_schedule/app/features/users/infra/models/user_model.dart';

class MocksModels {
  static final token = faker.guid.guid();
  static final objectId = faker.guid.guid();

  static final signUpModel = SignUpModel(
      email: faker.internet.email(),
      password: faker.internet.password(),
      fullName: faker.person.name(),
      phone: faker.phoneNumber.us(),
      company: faker.company.name(),
      specialty: faker.company.position(),
      token: "",
      objectId: "");

  static final userUpdateModel = UserUpdateModel(
    fullName: faker.person.name(),
    phone: faker.phoneNumber.us(),
    company: faker.company.name(),
    specialty: faker.company.position(),
  );

  static final newPasswordModel = NewPasswordModel(
    currentEmail: faker.internet.email(),
    newEmail: faker.internet.email(),
    currentPassword: faker.internet.password(),
    newPassword: faker.internet.password(),
  );

  static final usersModel = UserModel(
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

  static final scheduleDateModel =
      ScheduleDateModel(startDate: "2022-03-02", endDate: "2022-03-02");

  static final clientsCreateModel = ClientsCreateModel(
      name: faker.person.name(), phone: faker.phoneNumber.us());

  static final clientsUpdateModel = ClientsUpdateModel(
      name: faker.person.name(),
      phone: faker.phoneNumber.us(),
      objectId: faker.guid.guid());

  static final clientsModel = ClientsModel(
      objectId: objectId,
      name: 'name',
      phone: 'phone',
      createdByModel: usersModel,
      modifiedByModel: usersModel,
      createdAt: 'createdAt',
      updatedAt: 'updatedAt');
}

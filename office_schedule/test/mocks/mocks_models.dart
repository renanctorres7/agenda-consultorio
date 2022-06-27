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
}

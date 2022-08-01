abstract class ClientsCreateEntity {
  final String name;
  final String phone;
  final String? address;
  final String? notes;
  final String? email;

  ClientsCreateEntity(
      {required this.name,
      required this.phone,
      this.address,
      this.notes,
      this.email});
}

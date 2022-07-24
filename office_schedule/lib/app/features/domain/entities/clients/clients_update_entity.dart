abstract class ClientsUpdateEntity {
  final String objectId;
  final String name;
  final String phone;
  final String? address;
  final String? notes;
  final String? email;

  ClientsUpdateEntity(
      {required this.objectId,
      required this.name,
      required this.phone,
      this.address,
      this.notes,
      this.email});
}

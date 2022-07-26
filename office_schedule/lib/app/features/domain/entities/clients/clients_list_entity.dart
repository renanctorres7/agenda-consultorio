abstract class ClientsListEntity {
  final String objectId;
  final String name;
  final String phone;

  final String? email;

  ClientsListEntity({
    required this.objectId,
    required this.name,
    required this.phone,
    this.email,
  });
}

import '../../../users/domain/entities/user_entity.dart';

abstract class ClientsEntity {
  final String objectId;
  final String name;
  final String phone;
  final String? address;
  final String? notes;
  final String? email;
  final UserEntity createdBy;
  final UserEntity modifiedBy;
  final String createdAt;
  final String updatedAt;

  ClientsEntity({
    required this.objectId,
    required this.name,
    required this.phone,
    this.address,
    this.notes,
    this.email,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdAt,
    required this.updatedAt,
  });
}

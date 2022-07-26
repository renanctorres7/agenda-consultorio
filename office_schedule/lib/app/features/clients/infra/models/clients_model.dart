import 'package:json_annotation/json_annotation.dart';

import '../../../users/infra/models/user_model.dart';
import '../../domain/entities/entities.dart';

part 'clients_model.g.dart';

@JsonSerializable()
class ClientsModel extends ClientsEntity {
  @JsonKey(name: 'createdBy')
  final UserModel createdByModel;

  @JsonKey(name: 'modifiedBy')
  final UserModel modifiedByModel;

  ClientsModel({
    required super.objectId,
    required super.name,
    required super.phone,
    super.address,
    super.notes,
    super.email,
    required this.createdByModel,
    required this.modifiedByModel,
    required super.createdAt,
    required super.updatedAt,
  }) : super(createdBy: createdByModel, modifiedBy: modifiedByModel);

  factory ClientsModel.fromJson(Map<String, dynamic> json) =>
      _$ClientsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClientsModelToJson(this);

  factory ClientsModel.fromEntity(ClientsEntity entity) => ClientsModel(
      objectId: entity.objectId,
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      notes: entity.notes,
      email: entity.email,
      createdByModel: UserModel.fromEntity(entity.createdBy),
      modifiedByModel: UserModel.fromEntity(entity.modifiedBy),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt);
}

import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'clients_update_model.g.dart';

@JsonSerializable()
class ClientsUpdateModel extends ClientsUpdateEntity {
  ClientsUpdateModel(
      {required super.objectId,
      required super.name,
      required super.phone,
      super.address,
      super.notes,
      super.email});

  factory ClientsUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$ClientsUpdateModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClientsUpdateModelToJson(this);

  factory ClientsUpdateModel.fromEntity(ClientsUpdateEntity entity) =>
      ClientsUpdateModel(
          objectId: entity.objectId,
          name: entity.name,
          phone: entity.phone,
          address: entity.address,
          notes: entity.notes,
          email: entity.email);
}

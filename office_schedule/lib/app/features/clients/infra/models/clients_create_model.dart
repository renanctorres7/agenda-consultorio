import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/entities.dart';

part 'clients_create_model.g.dart';

@JsonSerializable()
class ClientsCreateModel extends ClientsCreateEntity {
  ClientsCreateModel(
      {required super.name,
      required super.phone,
      super.address,
      super.notes,
      super.email});

  factory ClientsCreateModel.fromJson(Map<String, dynamic> json) =>
      _$ClientsCreateModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClientsCreateModelToJson(this);

  factory ClientsCreateModel.fromEntity(ClientsCreateEntity entity) =>
      ClientsCreateModel(
          name: entity.name,
          phone: entity.phone,
          address: entity.address,
          notes: entity.notes,
          email: entity.email);
}

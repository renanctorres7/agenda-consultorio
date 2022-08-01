import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/entities.dart';

part 'clients_list_model.g.dart';

@JsonSerializable()
class ClientsListModel extends ClientsListEntity {
  ClientsListModel({
    required super.objectId,
    required super.name,
    required super.phone,
    super.email,
  });

  factory ClientsListModel.fromJson(Map<String, dynamic> json) =>
      _$ClientsListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClientsListModelToJson(this);

  factory ClientsListModel.fromEntity(ClientsListEntity entity) =>
      ClientsListModel(
          objectId: entity.objectId,
          name: entity.name,
          phone: entity.phone,
          email: entity.email);
}

import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/entities.dart';

part 'schedule_update_model.g.dart';

@JsonSerializable()
class ScheduleUpdateModel extends ScheduleUpdateEntity {
  ScheduleUpdateModel(
      {required super.objectId,
      super.datetime,
      super.client,
      super.typePayment,
      super.paymentStatus,
      super.scheduleStatus,
      super.description});

  factory ScheduleUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleUpdateModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleUpdateModelToJson(this);

  factory ScheduleUpdateModel.fromEntity(ScheduleUpdateEntity entity) =>
      ScheduleUpdateModel(
        objectId: entity.objectId,
        datetime: entity.datetime,
        client: entity.client,
        typePayment: entity.typePayment,
        paymentStatus: entity.paymentStatus,
        scheduleStatus: entity.scheduleStatus,
        description: entity.description,
      );
}

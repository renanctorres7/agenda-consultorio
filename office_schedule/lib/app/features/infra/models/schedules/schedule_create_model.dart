import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/entities.dart';

part 'schedule_create_model.g.dart';

@JsonSerializable()
class ScheduleCreateModel extends ScheduleCreateEntity {
  ScheduleCreateModel(
      {required super.datetime,
      required super.client,
      required super.typePayment,
      required super.paymentStatus,
      required super.scheduleStatus,
      super.description});

  factory ScheduleCreateModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleCreateModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleCreateModelToJson(this);

  factory ScheduleCreateModel.fromEntity(ScheduleCreateEntity entity) {
    return ScheduleCreateModel(
        datetime: entity.datetime,
        client: entity.client,
        typePayment: entity.typePayment,
        paymentStatus: entity.paymentStatus,
        scheduleStatus: entity.scheduleStatus,
        description: entity.description);
  }
}

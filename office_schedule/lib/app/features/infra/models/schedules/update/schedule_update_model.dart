import 'package:json_annotation/json_annotation.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';

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
}

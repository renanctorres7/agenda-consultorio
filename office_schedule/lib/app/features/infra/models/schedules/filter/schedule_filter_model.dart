import 'package:json_annotation/json_annotation.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';

part 'schedule_filter_model.g.dart';

@JsonSerializable()
class ScheduleFilterModel extends ScheduleFilterEntity {
  ScheduleFilterModel(
      {required super.page,
      required super.period,
      super.user,
      super.modifiedBy,
      super.client,
      super.scheduleStatus,
      super.typePayment,
      super.paymentStatus});

  factory ScheduleFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleFilterModelToJson(this);
}

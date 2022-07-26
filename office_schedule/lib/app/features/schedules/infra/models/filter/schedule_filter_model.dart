import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/entities.dart';

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

  factory ScheduleFilterModel.fromEntity(ScheduleFilterEntity entity) =>
      ScheduleFilterModel(
          page: entity.page,
          period: entity.period,
          user: entity.user,
          modifiedBy: entity.modifiedBy,
          client: entity.client,
          scheduleStatus: entity.scheduleStatus,
          typePayment: entity.typePayment,
          paymentStatus: entity.paymentStatus);
}

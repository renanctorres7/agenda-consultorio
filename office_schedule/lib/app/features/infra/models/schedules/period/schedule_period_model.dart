import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/entities.dart';

part 'schedule_period_model.g.dart';

@JsonSerializable()
class SchedulePeriodModel extends SchedulePeriodEntity {
  SchedulePeriodModel({required super.page, required super.period});

  factory SchedulePeriodModel.fromJson(Map<String, dynamic> json) =>
      _$SchedulePeriodModelFromJson(json);
  Map<String, dynamic> toJson() => _$SchedulePeriodModelToJson(this);
}

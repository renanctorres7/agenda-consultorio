import 'package:json_annotation/json_annotation.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';

part 'schedule_date_model.g.dart';

@JsonSerializable()
class ScheduleDateMode extends ScheduleDateEntity {
  ScheduleDateMode({super.startDate, super.endDate});

  factory ScheduleDateMode.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDateModeFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDateModeToJson(this);
}

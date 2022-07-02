import 'package:json_annotation/json_annotation.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';

part 'schedule_date_model.g.dart';

@JsonSerializable()
class ScheduleDateModel extends ScheduleDateEntity {
  ScheduleDateModel({super.startDate, super.endDate});

  factory ScheduleDateModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDateModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDateModelToJson(this);
}

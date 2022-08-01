import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/entities.dart';

part 'schedule_date_model.g.dart';

@JsonSerializable()
class ScheduleDateModel extends ScheduleDateEntity {
  ScheduleDateModel({super.startDate, super.endDate});

  factory ScheduleDateModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDateModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDateModelToJson(this);

  factory ScheduleDateModel.fromEntity(ScheduleDateEntity entity) =>
      ScheduleDateModel(startDate: entity.startDate, endDate: entity.endDate);
}

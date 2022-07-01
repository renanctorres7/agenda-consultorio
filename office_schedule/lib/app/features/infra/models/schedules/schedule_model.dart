import 'package:json_annotation/json_annotation.dart';
import 'package:office_schedule/app/features/domain/entities/entities.dart';
import 'package:office_schedule/app/features/infra/models/models.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class ScheduleModel extends ScheduleEntity {
  @JsonKey(name: 'user')
  final UsersModel userModel;

  @JsonKey(name: 'modifiedBy')
  final UsersModel modifiedByModel;

  ScheduleModel(
      {required super.objectId,
      required super.datetime,
      required super.client,
      required this.modifiedByModel,
      required this.userModel,
      required super.typePayment,
      required super.paymentStatus,
      required super.scheduleStatus,
      required super.createdAt,
      required super.updatedAt})
      : super(user: userModel, modifiedBy: modifiedByModel);

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
}

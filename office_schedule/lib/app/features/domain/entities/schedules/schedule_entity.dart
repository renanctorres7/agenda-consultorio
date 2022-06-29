import 'package:office_schedule/app/features/domain/entities/entities.dart';

abstract class ScheduleEntity {
  final String objectId;
  final String datetime;
  final String client;

  final UsersEntity user;

  final UsersEntity modifiedBy;

  final String typePayment;
  final String paymentStatus;

  final String scheduleStatus;
  final String createdAt;
  final String updatedAt;

  ScheduleEntity(
      {required this.objectId,
      required this.datetime,
      required this.client,
      required this.user,
      required this.modifiedBy,
      required this.typePayment,
      required this.paymentStatus,
      required this.scheduleStatus,
      required this.createdAt,
      required this.updatedAt});
}

import '../../../users/domain/entities/user_entity.dart';


abstract class ScheduleEntity {
  final String objectId;
  final String datetime;
  final String client;
  final String? registeredClient;
  final String? description;

  final UserEntity user;

  final UserEntity modifiedBy;

  final String typePayment;
  final String paymentStatus;

  final String scheduleStatus;
  final String createdAt;
  final String updatedAt;

  ScheduleEntity(
      {required this.objectId,
      required this.datetime,
      required this.client,
      this.registeredClient,
      this.description,
      required this.user,
      required this.modifiedBy,
      required this.typePayment,
      required this.paymentStatus,
      required this.scheduleStatus,
      required this.createdAt,
      required this.updatedAt});
}

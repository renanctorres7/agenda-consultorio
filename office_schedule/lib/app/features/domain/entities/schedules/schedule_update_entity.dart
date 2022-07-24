abstract class ScheduleUpdateEntity {
  final String objectId;

  final String? datetime;
  final String? client;
  final String? registeredClient;

  final String? typePayment;
  final String? paymentStatus;

  final String? scheduleStatus;
  final String? description;

  ScheduleUpdateEntity(
      {required this.objectId,
      this.datetime,
      this.client,
      this.registeredClient,
      this.typePayment,
      this.paymentStatus,
      this.scheduleStatus,
      this.description});
}

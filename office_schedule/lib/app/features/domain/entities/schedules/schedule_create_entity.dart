abstract class ScheduleCreateEntity {
  final String datetime;
  final String client;
  final String? registeredClient;

  final String typePayment;
  final String paymentStatus;

  final String scheduleStatus;
  final String? description;

  const ScheduleCreateEntity(
      {required this.datetime,
      required this.client,
      this.registeredClient,
      required this.typePayment,
      required this.paymentStatus,
      required this.scheduleStatus,
      this.description});
}

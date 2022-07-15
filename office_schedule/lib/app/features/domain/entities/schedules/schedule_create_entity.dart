abstract class ScheduleCreateEntity {
  final String datetime;
  final String client;

  final String typePayment;
  final String paymentStatus;

  final String scheduleStatus;
  final String? description;

  const ScheduleCreateEntity(
      {required this.datetime,
      required this.client,
      required this.typePayment,
      required this.paymentStatus,
      required this.scheduleStatus,
      this.description});
}

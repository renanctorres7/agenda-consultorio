abstract class ScheduleFilterEntity {
  final int page;
  final int period;
  final String? user;
  final String? modifiedBy;
  final String? client;
  final String? scheduleStatus;
  final String? typePayment;
  final String? paymentStatus;

  ScheduleFilterEntity(
      {required this.page,
      required this.period,
      this.user,
      this.modifiedBy,
      this.client,
      this.scheduleStatus,
      this.typePayment,
      this.paymentStatus});
}

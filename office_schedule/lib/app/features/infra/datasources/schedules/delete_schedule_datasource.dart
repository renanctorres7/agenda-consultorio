import '../../../domain/success/success.dart';

abstract class DeleteScheduleDatasource {
  Future<Success> deleteSchedule(String token, String objectId);
}

import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';

abstract class DeleteScheduleDatasource {
  Future<Success> deleteSchedule(String token, String objectId);
}

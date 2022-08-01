import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../core/core.dart';
import '../../../../core/endpoints/parse_endpoints.dart';
import '../../infra/models/models.dart';

part 'update_schedule_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class UpdateScheduleService {
  factory UpdateScheduleService(Dio dio) => _UpdateScheduleService(dio);

  @POST(ParseEndpoints.updateSchedule)
  @Headers(ParseHeaders.header)
  Future<void> updateSchedule(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() ScheduleUpdateModel scheduleUpdateModel);
}

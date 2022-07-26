import 'package:dio/dio.dart' hide Headers;
import 'package:office_schedule/app/features/infra/models/schedules/schedules.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/core.dart';
import '../../../../../../core/endpoints/parse_endpoints.dart';

part 'get_schedule_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class GetScheduleService {
  factory GetScheduleService(Dio dio) => _GetScheduleService(dio);

  @POST(ParseEndpoints.getSchedule)
  @Headers(ParseHeaders.header)
  Future<ScheduleModel?> getSchedule(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() Map<String, String> objectId);
}

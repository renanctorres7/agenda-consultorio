import 'package:dio/dio.dart' hide Headers;

import 'package:retrofit/retrofit.dart';

import '../../../../core/core.dart';
import '../../../../core/endpoints/parse_endpoints.dart';
import '../../infra/models/models.dart';

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

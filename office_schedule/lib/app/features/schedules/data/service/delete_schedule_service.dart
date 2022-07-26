import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../core/core.dart';
import '../../../../core/endpoints/parse_endpoints.dart';
import '../../infra/models/models.dart';

part 'delete_schedule_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class DeleteScheduleService {
  factory DeleteScheduleService(Dio dio) => _DeleteScheduleService(dio);

  @POST(ParseEndpoints.deleteSchedule)
  @Headers(ParseHeaders.header)
  Future<void> deleteSchedule(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() Map<String, String> objectIdMap);
}

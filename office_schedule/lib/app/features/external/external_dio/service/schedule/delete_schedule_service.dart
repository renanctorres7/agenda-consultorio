import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import '../../../../../core/core.dart';
import '../../../../../core/endpoints/parse_endpoints.dart';

part 'delete_schedule_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class CreateScheduleService {
  factory CreateScheduleService(Dio dio) => _CreateScheduleService(dio);

  @POST(ParseEndpoints.deleteSchedule)
  @Headers(ParseHeaders.header)
  Future<void> deleteSchedule(
      @Header(ParseHeaders.sessionTokenTitle) String sessionToken,
      @Body() Map<String, String> objectIdMap);
}

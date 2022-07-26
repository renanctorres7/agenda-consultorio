import 'package:dio/dio.dart' hide Headers;
import 'package:office_schedule/app/core/endpoints/parse_endpoints.dart';

import 'package:retrofit/retrofit.dart';

import '../../../../core/core.dart';
import '../../infra/models/models.dart';



part 'create_schedule_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class CreateScheduleService {
  factory CreateScheduleService(Dio dio) => _CreateScheduleService(dio);

  @POST(ParseEndpoints.createSchedule)
  @Headers(ParseHeaders.header)
  Future<void> createSchedule(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() ScheduleCreateModel scheduleCreateModel);
}

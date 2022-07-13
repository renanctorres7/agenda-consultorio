import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../../../core/endpoints/parse_endpoints.dart';
import '../../../../../../core/environments/environments.dart';
import '../../../../../../core/keys/parse_server/parse_headers.dart';
import '../../../../../infra/models/models.dart';

part 'update_schedule_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class UpdateScheduleService {
  factory UpdateScheduleService(Dio dio) => _UpdateScheduleService(dio);

  @POST(ParseEndpoints.updateSchedule)
  @Headers(ParseHeaders.header)
  Future<void> updateSchedule(
      @Header(ParseHeaders.sessionTokenTitle) String sessionToken,
      @Body() ScheduleUpdateModel scheduleUpdateModel);
}

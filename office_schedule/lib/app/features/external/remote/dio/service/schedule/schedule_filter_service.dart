import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/endpoints/parse_endpoints.dart';
import '../../../../../../core/environments/environments.dart';
import '../../../../../../core/keys/parse_server/parse_headers.dart';
import '../../../../../infra/models/models.dart';

part 'schedule_filter_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class ScheduleFilterService {
  factory ScheduleFilterService(Dio dio) => _ScheduleFilterService(dio);

  @POST(ParseEndpoints.listScheduleFilter)
  @Headers(ParseHeaders.header)
  Future<List<ScheduleModel>?> getListScheduleByFilter(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() ScheduleFilterModel scheduleCreateModel);
}

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../../core/core.dart';
import '../../../../../core/endpoints/parse_endpoints.dart';
import '../../../../infra/models/models.dart';

part 'schedule_period_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class SchedulePeriodService {
  factory SchedulePeriodService(Dio dio) => _SchedulePeriodService(dio);

  @POST(ParseEndpoints.listSchedulePeriod)
  @Headers(ParseHeaders.header)
  Future<List<ScheduleModel>?> getScheduleListByPeriod(
      @Header(ParseHeaders.sessionTokenTitle) String sessionToken,
      @Body() SchedulePeriodModel schedulePeriodModel);
}

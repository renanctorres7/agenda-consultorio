import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../../core/core.dart';
import '../../../../../core/endpoints/parse_endpoints.dart';
import '../../../../infra/models/models.dart';

part 'search_schedule_date_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class SearchScheduleDateService {
  factory SearchScheduleDateService(Dio dio) => _SearchScheduleDateService(dio);

  @POST(ParseEndpoints.searchScheduleDate)
  @Headers(ParseHeaders.header)
  Future<List<ScheduleModel>?> searchScheduleFromDate(
      @Header(ParseHeaders.sessionTokenTitle) String sessionToken,
      @Body() ScheduleDateModel scheduleDateModel);
}

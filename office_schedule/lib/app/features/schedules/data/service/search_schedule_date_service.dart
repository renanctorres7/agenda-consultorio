import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../../../core/endpoints/parse_endpoints.dart';
import '../../../../../../core/environments/environments.dart';
import '../../../../../../core/keys/parse_server/parse_headers.dart';
import '../../../../../infra/models/models.dart';

part 'search_schedule_date_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class SearchScheduleDateService {
  factory SearchScheduleDateService(Dio dio) => _SearchScheduleDateService(dio);

  @POST(ParseEndpoints.searchScheduleDate)
  @Headers(ParseHeaders.header)
  Future<List<ScheduleModel>?> searchScheduleFromDate(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() ScheduleDateModel scheduleDateModel);
}

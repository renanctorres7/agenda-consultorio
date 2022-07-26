import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../core/core.dart';
import '../../../../core/endpoints/parse_endpoints.dart';
import '../../../users/infra/models/user_model.dart';
import '../../infra/models/user_update_model.dart';

part 'update_profile_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class UpdateProfileService {
  factory UpdateProfileService(Dio dio) => _UpdateProfileService(dio);

  @POST(ParseEndpoints.updateProfile)
  @Headers(ParseHeaders.header)
  Future<UserModel?> updateProfile(
      @Header(ParseHeaders.sessionTokenTitle) String token,
      @Body() UserUpdateModel userUpdateModel);
}

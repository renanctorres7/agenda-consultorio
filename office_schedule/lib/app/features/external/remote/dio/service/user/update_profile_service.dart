import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/environments/environments.dart';
import '../../../../../../core/keys/parse_server/parse_headers.dart';
import '../../../../../infra/models/models.dart';

part 'update_profile_service.g.dart';

@RestApi(baseUrl: Environments.baseUrl)
abstract class UpdateProfileService {
  factory UpdateProfileService(Dio dio) => _UpdateProfileService(dio);

  @POST('/update-profile')
  @Headers(ParseHeaders.header)
  Future<UserModel?> updateProfile(
      @Header(ParseHeaders.sessionTokenTitle) String sessionToken,
      @Body() UserUpdateModel userUpdateModel);
}

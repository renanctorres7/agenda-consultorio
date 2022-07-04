import 'package:office_schedule/app/core/environments/environments.dart';

abstract class ParseHeaders {
  static Map<String, dynamic> headerWithoutSession() => {
        'X-Parse-Application-Id': Environments.applicationId,
        'X-Parse-REST-API-Key': Environments.restApi,
        'Content-Type': 'application/json'
      };

  static Map<String, dynamic> headerWithSession(String sessionToken) => {
        'X-Parse-Application-Id': Environments.applicationId,
        'X-Parse-REST-API-Key': Environments.restApi,
        'X-Parse-Session-Token': sessionToken,
        'Content-Type': 'application/json'
      };
}

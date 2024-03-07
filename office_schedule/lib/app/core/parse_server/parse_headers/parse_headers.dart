import 'package:office_schedule/app/core/environments/environments.dart';

abstract class ParseHeaders {
  static const Map<String, dynamic> header = {
    'X-Parse-Application-Id': Environments.applicationId,
    'X-Parse-REST-API-Key': Environments.restApi,
    'Content-Type': 'application/json'
  };

  static const Map<String, dynamic> loginHeader = {
    'X-Parse-Application-Id': Environments.applicationId,
    'X-Parse-REST-API-Key': Environments.restApi,
    'X-Parse-Revocable-Session': '1',
    'Content-Type': 'application/json'
  };

  static const sessionTokenTitle = 'X-Parse-Session-Token';
}

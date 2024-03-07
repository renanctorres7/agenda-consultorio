abstract class Environments {
  static const applicationId = String.fromEnvironment('APPLICATION_ID');
  static const restApi = String.fromEnvironment('REST_API');
  static const clientKey = String.fromEnvironment('CLIENT_KEY');

  static const baseUrl = String.fromEnvironment('BASE_URL');
  static const flavorConfig = String.fromEnvironment('FLAVOR_CONFIG');
}

class ConstantApi {
  ConstantApi._();

  /// Base Url
  static const String baseUrl =
      'http://ec2-100-26-203-215.compute-1.amazonaws.com';

  /// Receive Timeout
  static const int receiveTimeout = 15000;

  /// Conection Timeout
  static const int connectionTimeout = 15000;

  /// Endpoints
  static const String authEndpoint = '';
  static const String profileEndpoint = '/v2/profile';
  static const String familyEndpoint = '/v2/family';
  static const String medfacEndpoint = '/v2/medical';
  static const String sessionVaccine = '/v2/session';
}

class ConstantApi {
  ConstantApi._();

  /// Base Url
  static const String baseUrl =
      'http://ec2-100-26-203-215.compute-1.amazonaws.com';

  /// Receive Timeout
  static const int receiveTimeout = 10000;

  /// Conection Timeout
  static const int connectionTimeout = 10000;

  /// Endpoints
  static const String authEndpoint = '';
  static const String profileEndpoint = '/v2/profile';
  static const String familyEndpoint = '/v2/family';
}

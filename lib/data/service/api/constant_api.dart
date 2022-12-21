class ConstantApi {
  ConstantApi._();

  /// Base Url
  static const String baseUrl = 'https://wvac.cf';

  /// Receive Timeout
  static const int receiveTimeout = 15000;

  /// Conection Timeout
  static const int connectionTimeout = 15000;

  /// Endpoints
  static const String authEndpoint = '';
  static const String profileEndpoint = '/v2/profile';
  static const String familyEndpoint = '/v2/family';
  static const String medfacEndpoint = '/v2/medical';
  static const String sessionVaccineEndpoint = '/v2/session';
  static const String bookingVaccineEndpoint = '/v2/booking';
  static const String ticketEndpoind = '/v2/ticket';
}

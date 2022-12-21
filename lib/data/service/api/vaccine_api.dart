import 'package:dio/dio.dart';
import 'package:w_vaccine/data/service/api/constant_api.dart';
import 'package:w_vaccine/data/service/dio_client.dart';
import 'package:w_vaccine/data/service/dio_exception.dart';

class VaccineApi {
  final DioClient _dioClient;

  VaccineApi(this._dioClient);

  Future<Response> getMedicalFacilitys({
    required String token,
  }) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.medfacEndpoint}/',
        options: Options(
          headers: {"Authorization": 'Bearer $token'},
        ),
      );
      return res;
    } on DioError catch (e) {
      final String errorMsg = DioException.fromDioError(e).toString();
      throw errorMsg;
    }
  }

  Future<Response> searchMedicalFacilitys({
    required String token,
    required String searchTxt,
    required String dosis,
  }) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.medfacEndpoint}/',
        options: Options(
          headers: {"Authorization": 'Bearer $token'},
        ),
        queryParameters: {
          's': searchTxt,
          'q': dosis,
        },
      );
      return res;
    } on DioError catch (e) {
      final String errorMsg = DioException.fromDioError(e).toString();
      throw errorMsg;
    }
  }

  Future<Response> getVaccineSession({
    required String token,
    required int id,
  }) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.sessionVaccineEndpoint}/$id',
        options: Options(
          headers: {"Authorization": 'Bearer $token'},
        ),
      );
      return res;
    } on DioError catch (e) {
      final String errorMsg = DioException.fromDioError(e).toString();
      throw errorMsg;
    }
  }

  Future<Response> postBookvaccine({
    required String token,
    required int sessionId,
  }) async {
    try {
      final Response res = await _dioClient.post(
        '${ConstantApi.bookingVaccineEndpoint}/',
        options: Options(
          headers: {"Authorization": 'Bearer $token'},
        ),
        data: {
          'session_id': sessionId,
        },
      );
      return res;
    } on DioError catch (e) {
      final String errorMsg = DioException.fromDioError(e).toString();
      throw errorMsg;
    }
  }

  Future<Response> getBookTicket({
    required String token,
  }) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.bookingVaccineEndpoint}/',
        options: Options(
          headers: {"Authorization": 'Bearer $token'},
        ),
      );
      return res;
    } on DioError catch (e) {
      final String errorMsg = DioException.fromDioError(e).toString();
      throw errorMsg;
    }
  }
}

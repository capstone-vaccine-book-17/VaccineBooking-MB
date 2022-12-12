import 'package:dio/dio.dart';
import 'package:w_vaccine/data/service/api/constant_api.dart';
import 'package:w_vaccine/data/service/dio_client.dart';
import 'package:w_vaccine/data/service/dio_exception.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';

class ProfileApi {
  final DioClient _dioClient;

  ProfileApi(this._dioClient);

  Future<Response> getProfile({
    required String token,
  }) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.profileEndpoint}/',
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

  Future<Response> getPersonalData({
    required String token,
  }) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.profileEndpoint}/personal',
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

  Future<Response> getAddress({
    required String token,
  }) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.profileEndpoint}/address',
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

  Future<Response> putChangeAddress({
    required String token,
    required AddressData addressData,
  }) async {
    try {
      final Response res = await _dioClient.put(
        '${ConstantApi.profileEndpoint}/updateAddress',
        data: {
          'new_address': addressData.address,
          'province': addressData.province,
          'city': addressData.city,
          'post_code': addressData.postalCode
        },
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

  Future<Response> putChangeEmail({
    required String token,
    required String email,
  }) async {
    try {
      final Response res = await _dioClient.put(
        '${ConstantApi.profileEndpoint}/emailUpdate',
        data: {
          'email': email,
        },
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

  Future<Response> putChangePassword({
    required String token,
    required String oldPass,
    required String newPass,
    required String confirmNewPass,
  }) async {
    try {
      final Response res = await _dioClient.put(
        '${ConstantApi.profileEndpoint}/passwordUpdate',
        data: {
          'old_password': oldPass,
          'new_password': newPass,
          'confirm_new_password': confirmNewPass,
        },
        options: Options(
          headers: {"Authorization": 'Bearer $token'},
        ),
      );
      return res;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        throw 'Old password incorrect';
      }
      final String errorMsg = DioException.fromDioError(e).toString();
      throw errorMsg;
    }
  }
}

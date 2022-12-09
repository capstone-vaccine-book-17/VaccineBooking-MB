import 'package:dio/dio.dart';
import 'package:w_vaccine/data/service/api/constant_api.dart';
import 'package:w_vaccine/data/service/dio_client.dart';
import 'package:w_vaccine/data/service/dio_exception.dart';
import 'package:w_vaccine/features/auth/model/register_model.dart';

class AuthApi {
  final DioClient _dioClient;

  AuthApi(this._dioClient);

  Future<Response> postLogin({
    required String email,
    required String password,
  }) async {
    try {
      final Response res = await _dioClient.post(
        '${ConstantApi.authEndpoint}/signin',
        data: {
          'email': email,
          'password': password,
        },
      );
      return res;
    } on DioError catch (e) {
      // final String errorMsg = DioException.fromDioError(e).toString();
      throw "email or password incorrect";
    }
  }

  Future<Response> postRegister({
    required RegisterModel registerModel,
  }) async {
    try {
      final Response res = await _dioClient.post(
        '${ConstantApi.authEndpoint}/signup',
        data: {
          'name': registerModel.fullName,
          'nik': registerModel.nik,
          'address': registerModel.address,
          'email': registerModel.email,
          'dob': registerModel.dateOfBirth,
          'gender': registerModel.gender,
          'password': registerModel.pass,
        },
      );
      return res;
    } on DioError catch (e) {
      final String errorMsg = DioException.fromDioError(e).toString();
      throw errorMsg;
    }
  }
}

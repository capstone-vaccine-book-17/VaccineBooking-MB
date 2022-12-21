import 'package:dio/dio.dart';
import 'package:w_vaccine/data/service/api/constant_api.dart';
import 'package:w_vaccine/data/service/dio_client.dart';
import 'package:w_vaccine/data/service/dio_exception.dart';
import 'package:w_vaccine/dependency_injection/family_data.dart';

class FamilyApi {
  final DioClient _dioClient;

  FamilyApi(this._dioClient);

  Future<Response> getFamilyMember({
    required String token,
  }) async {
    try {
      final Response res = await _dioClient.get(
        '${ConstantApi.familyEndpoint}/',
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

  Future<Response> postFamilyMember({
    required String token,
    required FamilyMember familyMember,
  }) async {
    try {
      final Response res = await _dioClient.post(
        '${ConstantApi.familyEndpoint}/',
        data: {
          'name': familyMember.name,
          'nik': familyMember.nik,
          'age': familyMember.age,
          'gender': familyMember.gender,
          'relation': familyMember.relationship,
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

  Future<Response> deleteFamilyMember({
    required String token,
    required int id,
  }) async {
    try {
      final Response res = await _dioClient.delete(
        '${ConstantApi.familyEndpoint}/$id',
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

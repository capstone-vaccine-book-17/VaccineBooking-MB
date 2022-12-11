import 'package:w_vaccine/data/service/api/vaccine_api.dart';
import 'package:w_vaccine/dependency_injection/session_data.dart';
import 'package:w_vaccine/dependency_injection/vaccine_data.dart';

class VaccineRepository {
  final VaccineApi _profileApi;

  VaccineRepository(this._profileApi);

  Future<List<VaccineData>> getMedFac({
    required String token,
  }) async {
    try {
      final res = await _profileApi.getMedicalFacilitys(token: token);
      final medfac = (res.data['data'] as List)
          .map((e) => VaccineData.fromJson(e))
          .toList();
      return medfac;
    } catch (e) {
      print('Profile Error - ${e.toString()}');
      // return e.toString();
      rethrow;
    }
  }

  Future<List<VaccineData>> searchMedFac({
    required String token,
    required String searchTxt,
  }) async {
    try {
      final res = await _profileApi.searchMedicalFacilitys(
          token: token, searchTxt: searchTxt);
      final medfac = (res.data['data'] as List)
          .map((e) => VaccineData.fromJson(e))
          .toList();
      return medfac;
    } catch (e) {
      print('Profile Error - ${e.toString()}');
      // return e.toString();
      rethrow;
    }
  }

  Future<List<SessionData>> getSessionVaccine({
    required String token,
    required int id,
  }) async {
    try {
      final res = await _profileApi.getVaccineSession(
          token: token, id: id);
      final session = (res.data['data'] as List)
          .map((e) => SessionData.fromJson(e))
          .toList();
      return session;
    } catch (e) {
      print('Profile Error - ${e.toString()}');
      // return e.toString();
      rethrow;
    }
  }
}

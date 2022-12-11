import 'package:w_vaccine/data/service/api/vaccine_api.dart';
import 'package:w_vaccine/dependency_injection/session_data.dart';
import 'package:w_vaccine/dependency_injection/vaccine_data.dart';

class VaccineRepository {
  final VaccineApi _vaccineApi;

  VaccineRepository(this._vaccineApi);

  Future<List<VaccineData>> medicalFac({
    required String token,
  }) async {
    try {
      final res = await _vaccineApi.getMedicalFacilitys(token: token);
      final medfac = (res.data['data'] as List)
          .map((e) => VaccineData.fromJson(e))
          .toList();
      return medfac;
    } catch (e) {
      print('Medical Facilitys - ${e.toString()}');
      // return e.toString();
      rethrow;
    }
  }

  Future<List<VaccineData>> searchMedFac({
    required String token,
    required String searchTxt,
  }) async {
    try {
      final res = await _vaccineApi.searchMedicalFacilitys(
          token: token, searchTxt: searchTxt);
      final medfac = (res.data['data'] as List)
          .map((e) => VaccineData.fromJson(e))
          .toList();
      return medfac;
    } catch (e) {
      print('Medical Facilitys - ${e.toString()}');
      // return e.toString();
      rethrow;
    }
  }

  Future<List<SessionData>> sessionVaccine({
    required String token,
    required int id,
  }) async {
    try {
      final res = await _vaccineApi.getVaccineSession(token: token, id: id);
      final session = (res.data['data'] as List)
          .map((e) => SessionData.fromJson(e))
          .toList();
      return session;
    } catch (e) {
      print('Session Vaccine - ${e.toString()}');
      // return e.toString();
      rethrow;
    }
  }

  Future<void> bookVaccine({
    required String token,
    required int sessionId,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _vaccineApi.postBookvaccine(
        token: token,
        sessionId: sessionId,
      );
      print(sessionId);
      onSuccess!('Booking Vaccine Successfully');
    } catch (e) {
      print(e.toString());
      onError!(e.toString());
    }
  }
}

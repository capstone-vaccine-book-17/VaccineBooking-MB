import 'package:w_vaccine/data/service/api/vaccine_api.dart';
import 'package:w_vaccine/dependency_injection/book_data.dart';
import 'package:w_vaccine/dependency_injection/session_data.dart';
import 'dart:convert';
import 'package:w_vaccine/dependency_injection/vaccine_data.dart';

class VaccineRepository {
  final VaccineApi _vaccineApi;

  VaccineRepository(this._vaccineApi);

  Future<List<VaccineData>> medicalFac({
    required String token,
  }) async {
    try {
      final res = await _vaccineApi.getMedicalFacilitys(token: token);
      final medfac = ((res.data['data'] ?? []) as List)
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
    required String dosis,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _vaccineApi.searchMedicalFacilitys(
          token: token, searchTxt: searchTxt, dosis: dosis);
      final medfac = ((res.data['data'] ?? []) as List)
          .map((e) => VaccineData.fromJson(e))
          .toList();
      print('Medical $medfac');
      onSuccess!('Search $searchTxt');
      return medfac;
    } catch (e) {
      print('Medical Facilitys - ${e.toString()}');
      onError!(e.toString());
      rethrow;
    }
  }

  Future<List<SessionData>> sessionVaccine({
    required String token,
    required int id,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _vaccineApi.getVaccineSession(token: token, id: id);
      final session = (res.data['data'] as List)
          .map((e) => SessionData.fromJson(e))
          .toList();
      onSuccess!('Session Vaksin');
      return session;
    } catch (e) {
      print('Session Vaccine - ${e.toString()}');
      onError!(e.toString());
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
      // return res;

    } catch (e) {
      print(e.toString());
      onError!(e.toString());
    }
  }

  Future<Map<String, String>> bookTicketData({
    required String token,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _vaccineApi.getBookTicket(token: token);
      print('Ngecek njir');
      print(res);
      final dataraw = res.data['data'];
      Map<String, String> bookdata = {
        'queue': dataraw['queue'],
        'name': dataraw['name'],
        'nik': dataraw['nik'],
        'gender': dataraw['gender'],
        'vaccine': dataraw['vaccine'],
        'dosis': dataraw['dosis'],
        'date': dataraw['date'],
        'convDate': dataraw['conv_date'],
        'startTime': dataraw['start_time'],
        'endTime': dataraw['end_time'],
        'rsName': dataraw['rs_name'],
      };
      return bookdata;
    } catch (e) {
      print('Session Vaccine - ${e.toString()}');
      onError!(e.toString());
      rethrow;
    }
  }
}

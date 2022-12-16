import 'package:w_vaccine/data/service/api/family_api.dart';
import 'package:w_vaccine/dependency_injection/family_data.dart';

class FamilyRepository {
  final FamilyApi _familyApi;

  FamilyRepository(this._familyApi);

  Future<List<FamilyMember>> familyMember({
    required String token,
  }) async {
    try {
      final res = await _familyApi.getFamilyMember(token: token);
      final dataRaw = ((res.data['data'] ?? []) as List);
      return dataRaw.map((e) => FamilyMember.fromJson(e)).toList();
    } catch (e) {
      print('Family Error - ${e.toString()}');
      // return e.toString();
      rethrow;
    }
  }

  Future<void> addFamilyMember({
    required String token,
    required FamilyMember familyMember,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _familyApi.postFamilyMember(
        token: token,
        familyMember: familyMember,
      );
      final String msg = res.data['message'];
      onSuccess!(msg);
    } catch (e) {
      print('Add Family Error - ${e.toString()}');
      // return e.toString();
      onError!(e.toString());
    }
  }

  Future<bool> deleteFamilyMember({
    required int id,
    required String token,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _familyApi.deleteFamilyMember(
        token: token,
        id: id,
      );
      final String msg = res.data['message'];
      onSuccess!(msg);
      return true;
    } catch (e) {
      print('Delete Family Error - ${e.toString()}');
      // return e.toString();
      onError!(e.toString());
      return false;
    }
  }
}

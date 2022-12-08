import 'package:w_vaccine/data/service/api/profile_api.dart';

class ProfileRepository {
  final ProfileApi _profileApi;

  ProfileRepository(this._profileApi);

  Future<String> profile({
    required String token,
  }) async {
    try {
      final res = await _profileApi.getProfile(token: token);
      final String image = res.data['data']['image'];
      return image;
    } catch (e) {
      print('Profile Error - ${e.toString()}');
      // return e.toString();
      // rethrow;
      throw e.toString();
    }
  }

  Future<Map<String, String>> personalData({
    required String token,
  }) async {
    try {
      final res = await _profileApi.getPersonalData(token: token);
      final dataRaw = res.data['data'][0];
      Map<String, String> personal = {
        'fullName': dataRaw['name'],
        'nik': dataRaw['nik'],
        'gender': dataRaw['gender'],
        'dateOfBirth': dataRaw['dob'],
        'email': dataRaw['email'],
      };
      return personal;
    } catch (e) {
      print('Personal Data Error - ${e.toString()}');
      // return {'message': e.toString()};
      rethrow;
    }
  }

  Future<Map<String, String>> address({
    required String token,
  }) async {
    try {
      final res = await _profileApi.getAddress(token: token);
      final dataRaw = res.data['data'];
      Map<String, String> address = {
        'address': dataRaw['address'],
        'province': dataRaw['province'],
        'city': dataRaw['city'],
        'postalCode': dataRaw['post_code'],
      };
      return address;
    } catch (e) {
      print('Address Error - ${e.toString()}');
      // return {'message': e.toString()};
      rethrow;
    }
  }
}

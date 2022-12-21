import 'package:w_vaccine/data/service/api/profile_api.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';

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
      rethrow;
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

  Future<void> changeAddress({
    required String token,
    required AddressData addressData,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _profileApi.putChangeAddress(
        token: token,
        addressData: addressData,
      );
      final String msg = res.data['message'];
      onSuccess!(msg);
    } catch (e) {
      print('Change Address Error - ${e.toString()}');
      // return {'message': e.toString()};
      onError!(e.toString());
    }
  }

  Future<void> changeEmail({
    required String token,
    required String email,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _profileApi.putChangeEmail(
        token: token,
        email: email,
      );
      final String msg = res.data['message'];
      onSuccess!(msg);
    } catch (e) {
      print('Change Email Error - ${e.toString()}');
      // return {'message': e.toString()};
      onError!(e.toString());
    }
  }

  Future<void> changePassword({
    required String token,
    required String oldPass,
    required String newPass,
    required String confirmNewPass,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _profileApi.putChangePassword(
        token: token,
        oldPass: oldPass,
        newPass: newPass,
        confirmNewPass: confirmNewPass,
      );
      final String msg = res.data['message'];
      onSuccess!(msg);
    } catch (e) {
      print('Change Email Error - ${e.toString()}');
      // return {'message': e.toString()};
      onError!(e.toString());
    }
  }

  Future<dynamic> uploadImage({
    required String token,
    required filePath,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _profileApi.putUploadImage(
        token: token,
        filePath: filePath,
      );
      final String msg = res.data['message'];
      print(msg);
      // onSuccess!(msg);
      return res;
    } catch (e) {
      print('Upload Image Error - ${e.toString()}');
      // return {'message': e.toString()};
      onError!(e.toString());
    }
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPref {
  late FlutterSecureStorage _storage;

  SharedPref() {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  static const String _keyToken = 'TokenUltimateSecure';

  Future<void> saveToken({required String token}) async {
    return await _storage.write(key: _keyToken, value: token);
  }

  Future<String> deleteToken() async {
    String? token = await _storage.read(key: _keyToken);
    if (token == null) {
      return "Token not exist, can not proceed to delete";
    }
    await _storage.delete(key: _keyToken);
    return "Token delete successfully";
  }

  Future<String?> readToken() async {
    String? token = await _storage.read(key: _keyToken);
    print('Read Token: $token');
    return token;
  }
}

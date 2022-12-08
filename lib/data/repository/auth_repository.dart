import 'package:w_vaccine/data/service/api/auth_api.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/auth/model/register_model.dart';

class AuthRepository {
  final AuthApi _authApi;
  AuthRepository(this._authApi);

  Future<void> login({
    required String email,
    required String password,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _authApi.postLogin(
        email: email,
        password: password,
      );
      final String token = res.data['data']['token'];
      print(token);
      final SharedPref storage = getIt.get<SharedPref>();
      storage.saveToken(token: token);
      onSuccess!('Login Successfully');
    } catch (e) {
      print('Error ${e.toString()}');
      onError!(e.toString());
    }
  }

  Future<void> register({
    required RegisterModel registerModel,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      await _authApi.postRegister(registerModel: registerModel);
      onSuccess!('Register Successfully');
    } catch (e) {
      print(e.toString());
      onError!(e.toString());
    }
  }
}

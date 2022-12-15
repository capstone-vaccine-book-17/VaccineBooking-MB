import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/auth_repository.dart';
import 'package:w_vaccine/data/repository/profile_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/auth/page/login_page.dart';
import 'package:w_vaccine/features/index_navigation.dart';
import 'package:w_vaccine/styles/nofication.dart';

class LoginViewModel with ChangeNotifier {
  final _authRepo = getIt.get<AuthRepository>();
  final _profileRepo = getIt.get<ProfileRepository>();

  void submit({
    required context,
    required String email,
    required String pass,
  }) {
    _authRepo.login(
      email: email,
      password: pass,
      onSuccess: (msg, token) async {
        final SharedPref storage = getIt.get<SharedPref>();
        storage.saveToken(token: token);
        try {
          await initialLoad(context: context, token: token);
          snackbarMessage(context, msg);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const IndexNavigation(),
          ));
        } catch (e) { 
          /// Failed fetch all initial data
          snackbarMessage(context, e.toString());
        }
      },

      /// Failed Login
      onError: (msg) => snackbarMessage(context, msg),
    );
  }

  Future<void> initialLoad({
    required context,
    required String token,
  }) async {
    /// Do have a token but with 2 condition. Expire or not
    try {
      /// Token Not Expire
      final values = await Future.wait([
        _profileRepo.profile(token: token),
        _profileRepo.personalData(token: token),
        _profileRepo.address(token: token),
      ], eagerError: false);
      print(values);

      /// Assign All Data Profile to Global Object
      final profileData = getIt.get<ProfileData>();
      final temp = values[1] as Map<String, String>;
      final temp1 = values[2] as Map<String, String>;
      profileData.fullName = temp['fullName'];
      profileData.nik = temp['nik'];
      profileData.gender = temp['gender'];
      profileData.dateOfBirth = temp['dateOfBirth'];
      profileData.email = temp['email'];
      profileData.image = values[0] as String;
      profileData.address = AddressData(
        address: temp1['address'],
        province: temp1['province'],
        city: temp1['city'],
        postalCode: temp1['postalCode'],
      );
    } catch (e) {
      /// Token Expire
      /// Status Code 401: Unauthorized
      print(e.toString());
      snackbarMessage(context, 'Token Expire, need Re-Login');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      rethrow;
    }
  }
}

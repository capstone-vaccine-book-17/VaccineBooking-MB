import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/profile_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/auth/page/login_page.dart';
import 'package:w_vaccine/features/index_navigation.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class SplashViewModel with ChangeNotifier {
  final _profileRepo = getIt.get<ProfileRepository>();
  Future<void> initialLoad(context) async {
    print('MASUK INITIAL LOAD');
    final SharedPref storage = getIt.get<SharedPref>();
    String? token = await storage.readToken();

    /// Do not have a token
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
      return;
    }

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
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const IndexNavigation(),
      ));
    } catch (e) {
      /// Token Expire
      /// Status Code 401: Unauthorized
      print(e.toString());
      snackbarMessage(context, 'Token Expire, need Re-Login');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      return;
    }
  }
}

/*
Splash Screen Async Logic:
Cek Token di SharedPref
1. Tidak ada 
  -> lempar ke Login
Ada ? Cek expired nya
2. Ada tapi expire 
  -> lempar ke Login
  - HAPUS semua Store untuk Profile dan Family Member jika pake Shared Pref / SQlite
3. Ada dan tidak expire 
  -> lempar ke Index Navigation
  - Fetch 3 get API untuk profile
  - Store dimana ?? Shared Pref / Sqlite / Provider (Satu provider global / Tersebar di masing2 ViewModel);
  - Fetch Family Member
  - Store dimana ?? Shared Pref / Sqlite / Provider (Satu provider global / Tersebar di masing2 ViewModel);
DONE
*/

/// Contoh JWT Expire
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaXRpemVuSUQiOjEsImV4cCI6MTY3MDQ4MzcwOCwibmlrIjoiMzI0NTYyMTQ1Nzg1MzIxNCJ9.mh6MrWcEcOSwCyKkV5hG5KmGSaSiV9SAI30zHPGtiV0


/// Test
// try {
//   final res = await Dio().get(
//     'http://ec2-100-26-203-215.compute-1.amazonaws.com/v2/profile/',
//     options: Options(
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization":
//             "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaXRpemVuSUQiOjEsImV4cCI6MTY3MDQ4MzcwOCwibmlrIjoiMzI0NTYyMTQ1Nzg1MzIxNCJ9.mh6MrWcEcOSwCyKkV5hG5KmGSaSiV9SAI30zHPGtiV0",
//       },
//     ),
//   );
//   print(res);
// } on DioError catch (e) {
//   print(e);
//   print(e.response);
//   print(e.message);
// }
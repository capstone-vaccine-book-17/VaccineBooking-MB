import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/profile_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/auth/page/login_page.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class ChangeEmailViewModel with ChangeNotifier {
  final profileData = getIt.get<ProfileData>();
  final _profileRepo = getIt.get<ProfileRepository>();

  String get email => profileData.email ?? '';

  void submit({
    required context,
    required String email,
  }) async {
    final SharedPref storage = getIt.get<SharedPref>();
    String? token = await storage.readToken();
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
    _profileRepo.changeEmail(
      token: token!,
      email: email,
      onSuccess: (msg) {
        profileData.email = email;
        snackbarMessage(context, msg);
        Navigator.of(context).pop();
      },

      /// Token Expire : Unauthorized
      onError: (msg) {
        snackbarMessage(context, msg);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
    );
  }
}

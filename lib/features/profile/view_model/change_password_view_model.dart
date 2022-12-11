import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/profile_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class ChangePasswordViewModel with ChangeNotifier {
  final _profileRepo = getIt.get<ProfileRepository>();

  void submit({
    required context,
    required String oldPass,
    required String newPass,
    required String confirmNewPass,
  }) async {
    final storage = getIt.get<SharedPref>();
    final String? token = await storage.readToken();

    /// Do not have a token
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
      return;
    }
    _profileRepo.changePassword(
      token: token,
      oldPass: oldPass,
      newPass: newPass,
      confirmNewPass: confirmNewPass,
      onSuccess: (msg) {
        snackbarMessage(context, msg);
        Navigator.pop(context);
      },
      onError: (msg) {
        snackbarMessage(context, msg);
        Navigator.pop(context);
      },
    );
  }
}

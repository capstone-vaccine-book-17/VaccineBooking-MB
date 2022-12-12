import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/family_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class DetailFamilyMemberViewModel with ChangeNotifier {
  Future<bool> deleteFamilyMember({
    required context,
    required int id,
  }) async {
    final familyRepo = getIt.get<FamilyRepository>();
    final storage = getIt.get<SharedPref>();
    final String? token = await storage.readToken();

    /// Do not have a token
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
      return false;
    }
    bool isDeleteComplete = await familyRepo.deleteFamilyMember(
      id: id,
      token: token,

      /// Navigator pop action on the page because using bottom sheet
      onSuccess: (msg) {
        snackbarMessage(context, msg);
      },
      onError: (msg) {
        snackbarMessage(context, msg);
      },
    );
    return isDeleteComplete;
  }
}

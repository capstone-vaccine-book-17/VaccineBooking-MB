import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/family_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/family_data.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class AddFamilyMemberViewModel with ChangeNotifier {
  List<String> get genders => List.unmodifiable(['laki-laki', 'perempuan']);

  List<String> get relationships => List.unmodifiable(['ayah', 'ibu', 'anak']);

  final _familyRepo = getIt.get<FamilyRepository>();

  void submit({
    required context,
    required FamilyMember familyMember,
  }) async {
    final SharedPref storage = getIt.get<SharedPref>();
    final String? token = await storage.readToken();

    /// Do not have a token
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
      return;
    }
    _familyRepo.addFamilyMember(
      token: token,
      familyMember: familyMember,
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

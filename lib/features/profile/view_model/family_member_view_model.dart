import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/family_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/family_data.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class FamilyMemberViewModel with ChangeNotifier {
  final familyData = getIt.get<FamilyData>();

  List<FamilyMember> get family => familyData.family;

  /// After Add Family Member, must Re-Fetch again
  void getFamilyMemberAgain({required context}) async {
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

    final familyRepo = getIt.get<FamilyRepository>();
    final familyData = getIt.get<FamilyData>();
    try {
      final List<FamilyMember> family =
          await familyRepo.familyMember(token: token);
      familyData.family = family;
    } catch (e) {
      snackbarMessage(context, e.toString());
    } finally {
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/vaccine_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/dependency_injection/session_data.dart';
import 'package:w_vaccine/features/auth/page/login_page.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class SessionViewModel with ChangeNotifier {
  final SharedPref storage = getIt.get<SharedPref>();

  final _vaccineRepository = getIt.get<VaccineRepository>();
  static List<SessionData> _vaccineSession = [];
  List<SessionData> _vaccineSessionDisplay = List.from(_vaccineSession);

  List<SessionData> get vaccineSession => _vaccineSession;

  List<SessionData> get vaccineSessionDisplay => _vaccineSessionDisplay;

  void searchses(String date) {
    _vaccineSessionDisplay = vaccineSession
        .where((element) => element.date!.contains(date))
        .toList();
    notifyListeners();
  }

  Future<void> getSession({required int id, context}) async {
    String? token = await storage.readToken();
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
    final dataSession = await _vaccineRepository.sessionVaccine(
      token: token!,
      id: id,
      onSuccess: (msg) {
        snackbarMessage(context, msg);
      },

      /// Token Expire : Unauthorized
      onError: (msg) {
        snackbarMessage(context, msg);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
    );
    _vaccineSession = dataSession;
    print('ambil session');
    notifyListeners();
  }

  void booking({
    required context,
    required int sessionId,
  }) async {
    String? token = await storage.readToken();
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
    _vaccineRepository.bookVaccine(
      token: token!,
      sessionId: sessionId,
      onSuccess: (msg) {
        snackbarMessage(context, msg);
        Navigator.pop(context);
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

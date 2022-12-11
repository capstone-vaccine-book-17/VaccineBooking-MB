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
  List<SessionData> _vaccineSession = [];

  List<SessionData> get vaccineSession => _vaccineSession;

  Future<void> getSession({required int id}) async {
    String? token = await storage.readToken();

    final dataSession =
        await _vaccineRepository.sessionVaccine(token: token!, id: id);

    _vaccineSession = dataSession;
    print('ambil session');

    notifyListeners();
  }

  void booking({
    required context,
    required int sessionId,
  }) async {
    final SharedPref storage = getIt.get<SharedPref>();
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

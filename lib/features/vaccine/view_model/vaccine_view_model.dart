import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/vaccine_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/dependency_injection/vaccine_data.dart';
import 'package:w_vaccine/features/auth/page/login_page.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class VaccineViewModel extends ChangeNotifier {
  final _vaccineRepository = getIt.get<VaccineRepository>();
  final SharedPref storage = getIt.get<SharedPref>();
  final profiledata = getIt.get<AddressData>();

  List<VaccineData> _vaccine = [];
  List<VaccineData> get vaccine => _vaccine;
  String get addres => profiledata.address!;

  Future<void> getMedFacilitys(context) async {
    notifyListeners();
    String? token = await storage.readToken();
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
    final data = await _vaccineRepository.medicalFac(token: token!);
    _vaccine = data;

    notifyListeners();
  }

  Future<void> searchMedFacilitys(
      {required String searchtxt, required String dosis, context}) async {
    String? token = await storage.readToken();
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }

    final dataSearch = await _vaccineRepository.searchMedFac(
      token: token!,
      searchTxt: searchtxt,
      dosis: dosis,
      onSuccess: (msg) {
        snackbarMessage(context, msg);
      },
      onError: (msg) {
        snackbarMessage(context, msg);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
    );

    _vaccine = dataSearch;
    print('ambil faskes');
    notifyListeners();
  }
}

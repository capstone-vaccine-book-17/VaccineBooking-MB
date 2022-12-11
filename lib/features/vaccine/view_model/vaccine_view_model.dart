import 'package:flutter/cupertino.dart';
import 'package:w_vaccine/data/repository/vaccine_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/dependency_injection/vaccine_data.dart';

class VaccineViewModel extends ChangeNotifier {
  final _vaccineRepository = getIt.get<VaccineRepository>();
  final SharedPref storage = getIt.get<SharedPref>();

  List<VaccineData> _vaccine = [];
  List<VaccineData> get vaccine => _vaccine;

  Future<void> getMedFacilitys() async {
    notifyListeners();
    String? token = await storage.readToken();

    final data = await _vaccineRepository.medicalFac(token: token!);
    _vaccine = data;

    notifyListeners();
  }

  Future<void> searchMedFacilitys({required String searchtxt, context}) async {
    notifyListeners();
    String? token = await storage.readToken();

    final dataSearch = await _vaccineRepository.searchMedFac(
        token: token!, searchTxt: searchtxt);

    _vaccine = dataSearch;
    print('ambil api');

    notifyListeners();
  }
}

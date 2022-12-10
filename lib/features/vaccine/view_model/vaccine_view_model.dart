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
  bool isLoading = false;

  Future<void> getMedFacilitys() async {
    isLoading = true;
    notifyListeners();
    String? token = await storage.readToken();

    final data = await _vaccineRepository.getMedFac(token: token!);
    _vaccine = data;

    isLoading = false;
    notifyListeners();
  }

  Future<void> searchMedFacilitys({required String searchtxt}) async {
    isLoading = true;
    notifyListeners();
    String? token = await storage.readToken();

    final dataSearch = await _vaccineRepository.searchMedFac(
        token: token!, searchTxt: searchtxt);
    _vaccine = dataSearch;
    print('ambil api');

    isLoading = false;
    notifyListeners();
  }
}

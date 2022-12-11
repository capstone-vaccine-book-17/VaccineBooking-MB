import 'package:flutter/widgets.dart';
import 'package:w_vaccine/data/repository/vaccine_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/dependency_injection/session_data.dart';

class SessionViewModel with ChangeNotifier {
  final SharedPref storage = getIt.get<SharedPref>();
  final _vaccineRepository = getIt.get<VaccineRepository>();
  List<SessionData> _vaccineSession = [];

  List<SessionData> get vaccineSession => _vaccineSession;

  Future<void> getSession({required int id}) async {
    String? token = await storage.readToken();

    final dataSession =
        await _vaccineRepository.getSessionVaccine(token: token!, id: id);

    _vaccineSession = dataSession;
    print('ambil session');

    notifyListeners();
  }
}

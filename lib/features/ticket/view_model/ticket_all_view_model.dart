import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/ticket_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/dependency_injection/session_data.dart';
import 'package:w_vaccine/dependency_injection/ticket_data.dart';
import 'package:w_vaccine/features/auth/page/login_page.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/custom_color.dart';
import 'package:w_vaccine/dependency_injection/ticket_data.dart';
import 'package:w_vaccine/styles/nofication.dart';
import '../model/ticket_model.dart';

class TicketAllViewModel with ChangeNotifier {
  final SharedPref storage = getIt.get<SharedPref>();
  final _ticketRepository = getIt.get<TicketRepository>();

  void getTicketAll({required id, required BuildContext context}) {}
}

final SharedPref storage = getIt.get<SharedPref>();

final _ticketRepository = getIt.get<TicketRepository>();
List<TicketData> _ticketSession = [];

List<TicketData> get ticketSession => _ticketSession;

Future<void> getSession({required int id, context}) async {
  String? token = await storage.readToken();
  if (token == null) {
    snackbarMessage(context, 'Debug Mode - Do not have token');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }
  final TicketData = await _ticketRepository.allTicket(
    token: token!,

    /// Token Expire : Unauthorized
  );
  _ticketSession = TicketData;
  print('ticket');
}

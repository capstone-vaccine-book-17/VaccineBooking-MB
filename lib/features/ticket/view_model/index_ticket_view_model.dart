import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/ticket_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/dependency_injection/ticket_data.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class IndexTicketViewModel with ChangeNotifier {
  final _ticketData = getIt.get<TicketData>();
  final _ticketRepo = getIt.get<TicketRepository>();

  List<TicketDetail> get ticketsAll => _ticketData.tickets;
  List<TicketDetail> get ticketsCompleted {
    return _ticketData.tickets.where((e) => e.status == 'selesai').toList();
  }

  List<TicketDetail> get ticketsWaitingQueue {
    return _ticketData.tickets.where((e) => e.status == 'process').toList();
  }

  Future<void> initialLoad(context) async {
    print("Initial Load Ticket");
    final storage = getIt.get<SharedPref>();
    final String? token = await storage.readToken();

    /// Do not have a token
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
      return;
    }
    try {
      final List<TicketDetail> tickets =
          await _ticketRepo.allTicket(token: token);
      print(tickets);
      _ticketData.tickets = tickets;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      snackbarMessage(context, e.toString());
    }
  }
}

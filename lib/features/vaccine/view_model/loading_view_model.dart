import 'dart:async';

import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/vaccine_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/dependency_injection/session_data.dart';
import 'package:w_vaccine/features/auth/page/login_page.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/features/vaccine/page/detail_book_page.dart';
import 'package:w_vaccine/styles/nofication.dart';

class LoadBookViewModel with ChangeNotifier {
  final _vaccinerepository = getIt.get<VaccineRepository>();
  final SharedPref storage = getIt.get<SharedPref>();
  var bookData = getIt.get<SessionData>();

  Future<void> getBookTicket(context) async {
    String? token = await storage.readToken();
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
    try {
      final bookTicket = await _vaccinerepository.bookTicketData(token: token!);
      print(bookTicket);
      bookData.bookData = BookData(
        queue: bookTicket['queue'],
        name: bookTicket['name'],
        nik: bookTicket['nik'],
        gender: bookTicket['gender'],
        vaccine: bookTicket['vaccine'],
        dosis: bookTicket['dosis'],
        date: bookTicket['date'],
        convDate: bookTicket['convDate'],
        startTime: bookTicket['startTime'],
        endTime: bookTicket['endTime'],
        rsName: bookTicket['rsName'],
      );
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const DetailBook(
                      // data: data,
                      ))));
    } catch (e) {
      
      (msg) {
        snackbarMessage(context, msg);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      };
      print(e);
    }
  }
}

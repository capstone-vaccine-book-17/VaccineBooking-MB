import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/ticket_repository.dart';
import 'package:w_vaccine/dependency_injection/ticket_data.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';
import '../../../data/service/local/shared_pref.dart';
import '../../../dependency_injection/service_locator.dart';
import '../model/ticket_model.dart';

class DetailTicketProcessViewModel with ChangeNotifier {
  final SharedPref storage = getIt.get<SharedPref>();
  final _ticketRepository = getIt.get<TicketRepository>();

  void getTicketAll({required id, required BuildContext context}) {
    List<TicketData> _ticketProcess = [];
    // List<TicketData> get ticketProcess => _ticketProcess [];

    Future<void> getTicket({required int id, context}) async {
      String? token = await storage.readToken();
      if (token == null) {
        snackbarMessage(context, 'Debug Mode - Do not have token');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
      final TicketData = await _ticketRepository.ticketProcess(
        token: token!,

        /// Token Expire : Unauthorized
      );
      _ticketProcess = TicketData;
      print('ticket');
    }
  }

  List<TicketModel> get tickets {
    return [
      TicketModel(
          image: 'assets/images/worldvaksin.png',
          iconvaccine: 'assets/images/iconvaccine.png',
          iconlocation: 'assets/images/location.png',
          detail: 'Detail Pendaftaran',
          description11: 'Dosis Pertama',
          description12: 'Dosis Kedua',
          done: 'selesai',
          number: 'No Antrian : 100',
          name: 'Nama Lengkap',
          description10: 'kedua',
          description1: 'Afifah',
          nik: 'No nik',
          button: 'proses',
          button1: 'Selesai',
          description2: '157102170201011',
          gender: 'Jenis Kelamin',
          description3: 'Perempuan',
          type: 'Jenis Vaksin',
          description4: 'Sinovac',
          vaccine: 'Dosis',
          color: '',
          description5: 'Pertama',
          date: 'Tanggal Vaksinasi',
          description6: '17 November 2022',
          time: 'Waktu',
          description7: '08.00 - 10.00',
          location: 'Lokasi Vaksin',
          description8: 'Rs. Abdi Waluyo',
          description9:
              'Silahkan datang ke lokasi yang telah\n ditentukan tepat waktu'),
    ];
  }
}

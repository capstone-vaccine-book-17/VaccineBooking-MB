import 'package:flutter/material.dart';
import '../model/ticket_model.dart';

class TicketAllViewModel with ChangeNotifier {
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
          button: 'Proses',
          button1: '',
          name: 'Nama Lengkap',
          description10: 'kedua',
          description1: 'Afifah',
          nik: 'No nik',
          description2: '157102170201011',
          gender: 'Jenis Kelamin',
          description3: 'Perempuan',
          type: 'Jenis Vaksin',
          description4: 'Sinovac',
          vaccine: 'Dosis',
          description5: 'Pertama',
          date: 'Tanggal Vaksinasi',
          description6: '17 November 2022',
          time: 'Waktu',
          description7: '08.00 - 10.00',
          location: 'Lokasi Vaksin',
          description8: 'Rs. Abdi Waluyo',
          description9:
              'Silahkan datang ke lokasi yang telah\n ditentukan tepat waktu'),
      TicketModel(
          image: 'assets/images/worldvaksin.png',
          iconvaccine: 'assets/images/iconvaccine.png',
          iconlocation: 'assets/images/location.png',
          detail: 'Detail Pendaftaran',
          description11: 'Dosis Kedua',
          description12: 'Dosis Pertama',
          done: 'selesai',
          number: 'No Antrian : 100',
          name: 'Nama Lengkap',
          button: 'Selesai',
          button1: '',
          description10: 'kedua',
          description1: 'Afifah',
          nik: 'No nik',
          description2: '157102170201011',
          gender: 'Jenis Kelamin',
          description3: 'Perempuan',
          type: 'Jenis Vaksin',
          description4: 'Sinovac',
          vaccine: 'Dosis',
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

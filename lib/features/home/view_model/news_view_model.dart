import 'package:flutter/widgets.dart';
import 'package:w_vaccine/features/home/model/news_model.dart';

class NewsViewModel with ChangeNotifier {
  List<NewsModel> get news {
    return [
      NewsModel(
        title: 'Ini hal penting yang wajib kamu ketahui',
        author: 'Kobo Kanaeru',
        date: '12/09/2022 09:31',
        views: '23',
        description:
            'Saat ini, terdapat jutaan orang di seluruh dunia yang telah menerima vaksin COVID-19 dengan aman, membawa kita semua satu langkah lebih dekat untuk kembali berkegiatan seperti biasa dan bertemu dengan keluarga serta kerabat tercinta. Vaksin dinanti-nantikan oleh banyak orang, namun amat wajar jika sebagian orang masih bertanya-tanya mengenai proses vaksinasi dan apa saja yang perlu diantisipasi saat giliran mereka tiba nanti.Kami telah berbicara dengan ahli-ahli kesehatan di UNICEF untuk menjawab pertanyaan seputar proses vaksinasi dan beberapa kiat sebelum, saat, dan sesudah vaksinasi.Saat menerima vaksin :Ikuti protokol kesehatan.Pastikan Anda selalu mengikuti aturan kesehatan pada lokasi vaksinasi, misalnya menjaga jarak saat menunggu panggilan atau mengenakan masker.Berterus terang tentang kondisi diri sendiri. Sampaikan kepada tenaga kesehatan jika Anda memiliki kondisi yang harus diperhatikan, seperti sedang mengandung atau mengalami gangguan kekebalan tubuh.Simpan bukti vaksinasi. Penerima vaksin akan menerima kartu yang menyatakan jenis vaksin COVID-19 yang diterima, waktu, dan lokasi vaksinasi. Simpan kartu ini dengan baik kalau-kalau dibutuhkan pada masa mendatang.',
      ),
      NewsModel(
        title: 'Ini hal penting yang wajib kamu ketahui',
        author: 'Kobo Kanaeru',
        date: '12/09/2022 09:31',
        views: '23',
        description:
            'Saat ini, terdapat jutaan orang di seluruh dunia yang telah menerima vaksin COVID-19 dengan aman, membawa kita semua satu langkah lebih dekat untuk kembali berkegiatan seperti biasa dan bertemu dengan keluarga serta kerabat tercinta. Vaksin dinanti-nantikan oleh banyak orang, namun amat wajar jika sebagian orang masih bertanya-tanya mengenai proses vaksinasi dan apa saja yang perlu diantisipasi saat giliran mereka tiba nanti.Kami telah berbicara dengan ahli-ahli kesehatan di UNICEF untuk menjawab pertanyaan seputar proses vaksinasi dan beberapa kiat sebelum, saat, dan sesudah vaksinasi.Saat menerima vaksin :Ikuti protokol kesehatan.Pastikan Anda selalu mengikuti aturan kesehatan pada lokasi vaksinasi, misalnya menjaga jarak saat menunggu panggilan atau mengenakan masker.Berterus terang tentang kondisi diri sendiri. Sampaikan kepada tenaga kesehatan jika Anda memiliki kondisi yang harus diperhatikan, seperti sedang mengandung atau mengalami gangguan kekebalan tubuh.Simpan bukti vaksinasi. Penerima vaksin akan menerima kartu yang menyatakan jenis vaksin COVID-19 yang diterima, waktu, dan lokasi vaksinasi. Simpan kartu ini dengan baik kalau-kalau dibutuhkan pada masa mendatang.',
      ),
    ];
  }
}

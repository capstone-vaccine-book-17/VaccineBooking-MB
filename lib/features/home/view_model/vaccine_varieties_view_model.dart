import 'package:flutter/material.dart';
import 'package:w_vaccine/features/home/model/vaccine_model.dart';

class VaccineVaritiesViewModel with ChangeNotifier {
  List<VaccineModel> get vaccines {
    return [
      VaccineModel(
        name: 'Corona Vac',
        type: 'Vaccine Covid-19',
        image: 'assets/images/coronavac.jpg',
        description1:
            'CoronaVac adalah satu dari tiga vaksin COVID-19 eksperimental yang telah digunakan China dan disuntikkan ke ratusan ribu orang di bawah program penggunaan darurat. Vaksin ini berasal dari virus yang dilemahkan atau dibunuh dengan zat kimia. Dilansir dari CNBC Indonesia Tingkat antibodi yang dihasilkan vaksin bernama CoronaVac ini lebih rendah daripada orang yang telah pulih dari virus corona baru, tetapi para peneliti mengungkapkan hal itu cukup memberikan perlindungan yang cukup bagi pengguna.',
        description2:
            'Banyak Vaksin yang telah diuji secara klinis sebagaimana CoronaVac ini. dan setiap vaksin yang telah diujikan selalu memiliki nilai positif agar memudahkan dalam penyebar luasannya. Gang Zeng, seorang peneliti Sinovac yang terlibat dalam studi CoronaVac, mengatakan vaksin ini bisa menjadi pilihan yang menarik karena dapat disimpan di lemari es normal dengan suhu 2-8 derajat Celcius dan dapat tetap stabil hingga tiga tahun. “Hal ini akan menawarkan beberapa keuntungan untuk distribusi ke daerah di mana akses ke pendinginan sulit,” kata Gang Zeng.',
        description3:
            'Di Indonesia sendiri tepatnya dibandung, vaksin Coronavac ini telah diuji coba sebanyak 2 kali yang pertama di ikuti oleh sekitar 1620 dan yang kedua di uji coba sebanyak 1603 peserta, namun dalam perjalanannya masih terjadi banyak misd komunikasi terkait perizinan percobaan penyuntikan vaksin ini. Hal ini akhirnya membuat para relawan yang mengikuti uji coba ini merasa bingung dan merasa seolah-olah menjadi kelinci percobaan.',
      ),
      VaccineModel(
        name: 'COVID-19 Bio Farma',
        type: 'Booster',
        image: 'assets/images/biofarma.jpeg',
        description1:
            'Vaksin Biofarma merupakan vaksin produksi perusahaan Sinovac asal China yang menggunakan platform inactivated virus, sehingga tak dapat menginfeksi tubuh manusia dan bahkan mendorong terbentuknya imun dalam tubuh.Dalam keterangan di situs tersebut, juru bicara vaksinasi Bio Farma Bambang Heriyanto menegaskan semua bahan baku produksi Bio Farma setelah diolah menjadi vaksin jadi terlebih dahulu harus melalui serangkaian uji mutu (quality control) yang ketat yang dilakukan oleh laboratorium Bio Farma dan Badan Pengawas Obat dan Makanan (BPOM). Dengan demikian, dipastikan vaksin memenuhi standar dan mutu yang telah ditetapkan.',
        description2:
            'Di Indonesia sendiri tepatnya dibandung, vaksin Coronavac ini telah diuji coba sebanyak 2 kali yang pertama di ikuti oleh sekitar 1620 dan yang kedua di uji coba sebanyak 1603 peserta, namun dalam perjalanannya masih terjadi banyak misd komunikasi terkait perizinan percobaan penyuntikan vaksin ini. Hal ini akhirnya membuat para relawan yang mengikuti uji coba ini merasa bingung dan merasa seolah-olah menjadi kelinci percobaan.',
        description3: '',
      ),
      VaccineModel(
        name: 'AstraZeneca',
        type: 'Vaccine Covid-19',
        image: 'assets/images/astra.jpg',
        description1:
            'CoronaVac adalah satu dari tiga vaksin COVID-19 eksperimental yang telah digunakan China dan disuntikkan ke ratusan ribu orang di bawah program penggunaan darurat. Vaksin ini berasal dari virus yang dilemahkan atau dibunuh dengan zat kimia. Dilansir dari CNBC Indonesia Tingkat antibodi yang dihasilkan vaksin bernama CoronaVac ini lebih rendah daripada orang yang telah pulih dari virus corona baru, tetapi para peneliti mengungkapkan hal itu cukup memberikan perlindungan yang cukup bagi pengguna.',
        description2:
            'Banyak Vaksin yang telah diuji secara klinis sebagaimana CoronaVac ini. dan setiap vaksin yang telah diujikan selalu memiliki nilai positif agar memudahkan dalam penyebar luasannya. Gang Zeng, seorang peneliti Sinovac yang terlibat dalam studi CoronaVac, mengatakan vaksin ini bisa menjadi pilihan yang menarik karena dapat disimpan di lemari es normal dengan suhu 2-8 derajat Celcius dan dapat tetap stabil hingga tiga tahun. “Hal ini akan menawarkan beberapa keuntungan untuk distribusi ke daerah di mana akses ke pendinginan sulit,” kata Gang Zeng.',
        description3:
            'Di Indonesia sendiri tepatnya dibandung, vaksin Coronavac ini telah diuji coba sebanyak 2 kali yang pertama di ikuti oleh sekitar 1620 dan yang kedua di uji coba sebanyak 1603 peserta, namun dalam perjalanannya masih terjadi banyak misd komunikasi terkait perizinan percobaan penyuntikan vaksin ini. Hal ini akhirnya membuat para relawan yang mengikuti uji coba ini merasa bingung dan merasa seolah-olah menjadi kelinci percobaan.',
      ),
      VaccineModel(
        name: 'Moderna',
        type: 'Vaccine Covid-19',
        image: 'assets/images/moderna.jpg',
        description1:
            'CoronaVac adalah satu dari tiga vaksin COVID-19 eksperimental yang telah digunakan China dan disuntikkan ke ratusan ribu orang di bawah program penggunaan darurat. Vaksin ini berasal dari virus yang dilemahkan atau dibunuh dengan zat kimia. Dilansir dari CNBC Indonesia Tingkat antibodi yang dihasilkan vaksin bernama CoronaVac ini lebih rendah daripada orang yang telah pulih dari virus corona baru, tetapi para peneliti mengungkapkan hal itu cukup memberikan perlindungan yang cukup bagi pengguna.',
        description2:
            'Banyak Vaksin yang telah diuji secara klinis sebagaimana CoronaVac ini. dan setiap vaksin yang telah diujikan selalu memiliki nilai positif agar memudahkan dalam penyebar luasannya. Gang Zeng, seorang peneliti Sinovac yang terlibat dalam studi CoronaVac, mengatakan vaksin ini bisa menjadi pilihan yang menarik karena dapat disimpan di lemari es normal dengan suhu 2-8 derajat Celcius dan dapat tetap stabil hingga tiga tahun. “Hal ini akan menawarkan beberapa keuntungan untuk distribusi ke daerah di mana akses ke pendinginan sulit,” kata Gang Zeng.',
        description3:
            'Di Indonesia sendiri tepatnya dibandung, vaksin Coronavac ini telah diuji coba sebanyak 2 kali yang pertama di ikuti oleh sekitar 1620 dan yang kedua di uji coba sebanyak 1603 peserta, namun dalam perjalanannya masih terjadi banyak misd komunikasi terkait perizinan percobaan penyuntikan vaksin ini. Hal ini akhirnya membuat para relawan yang mengikuti uji coba ini merasa bingung dan merasa seolah-olah menjadi kelinci percobaan.',
      ),
      VaccineModel(
        name: 'Pfizer',
        type: 'Vaccine Covid-19',
        image: 'assets/images/pfi.jpeg',
        description1:
            'CoronaVac adalah satu dari tiga vaksin COVID-19 eksperimental yang telah digunakan China dan disuntikkan ke ratusan ribu orang di bawah program penggunaan darurat. Vaksin ini berasal dari virus yang dilemahkan atau dibunuh dengan zat kimia. Dilansir dari CNBC Indonesia Tingkat antibodi yang dihasilkan vaksin bernama CoronaVac ini lebih rendah daripada orang yang telah pulih dari virus corona baru, tetapi para peneliti mengungkapkan hal itu cukup memberikan perlindungan yang cukup bagi pengguna.',
        description2:
            'Banyak Vaksin yang telah diuji secara klinis sebagaimana CoronaVac ini. dan setiap vaksin yang telah diujikan selalu memiliki nilai positif agar memudahkan dalam penyebar luasannya. Gang Zeng, seorang peneliti Sinovac yang terlibat dalam studi CoronaVac, mengatakan vaksin ini bisa menjadi pilihan yang menarik karena dapat disimpan di lemari es normal dengan suhu 2-8 derajat Celcius dan dapat tetap stabil hingga tiga tahun. “Hal ini akan menawarkan beberapa keuntungan untuk distribusi ke daerah di mana akses ke pendinginan sulit,” kata Gang Zeng.',
        description3:
            'Di Indonesia sendiri tepatnya dibandung, vaksin Coronavac ini telah diuji coba sebanyak 2 kali yang pertama di ikuti oleh sekitar 1620 dan yang kedua di uji coba sebanyak 1603 peserta, namun dalam perjalanannya masih terjadi banyak misd komunikasi terkait perizinan percobaan penyuntikan vaksin ini. Hal ini akhirnya membuat para relawan yang mengikuti uji coba ini merasa bingung dan merasa seolah-olah menjadi kelinci percobaan.',
      ),
    ];
  }
}

import 'package:flutter/material.dart';

class ChangeAddressViewModel with ChangeNotifier {
  List<String> get provinces {
    return List.unmodifiable(_region.keys.map((e) => e).toList());
  }

  List<String> cities(String province) {
    return List.unmodifiable(_region[province] ?? ['']);
  }

  void submit({
    required String newAddress,
    required String province,
    required String city,
    required String postalCode,
  }) {
    print(newAddress);
    print(province);
    print(city);
    print(postalCode);
  }

  final Map<String, List<String>> _region = {
    'DKI Jakarta': [
      'Kota Jakarta Barat',
      'Kota Jakarta Pusat',
      'Kota Jakarta Selatan',
      'Kota Jakarta Timur',
      'Kota Jakarta Utara',
      'Kabupaten Kepulauan Seribu',
    ],
    'Banten': [
      'Kabupaten Lebak',
      'Kabupaten Pandeglang',
      'Kabupaten Serang',
      'Kabupaten Tanggerang',
      'Kabupaten Cilegon',
      'Kota Serang',
      'Kota Tanggerang',
      'Kota Selatan Tanggerang',
    ],
    'Daerah Istimewa Yogyakarta': [
      'Kabupaten Bantul',
      'Kabupaten Gunungkidul',
      'Kabupaten Kulon Progo',
      'Kabupaten Sleman',
      'Kota Yogyakarta',
    ],
    'Jawa Barat': [
      'Kabupaten Bandung',
      'Kabupaten Bandung Barat',
      'Kabupaten Bekasi',
      'Kabupaten Bogor',
      'Kabupaten Ciamis',
      'Kabupaten Cianjur',
      'Kabupaten Cirebon',
      'Kabupaten Garut',
    ],
    'Jawa Tengah': [
      'Kabupaten Banjarnegara',
      'Kabupaten Purwokerto',
      'Kabupaten Batang',
      'Kabupaten Biora',
      'Kabupaten Boyolali',
      'Kabupaten Brebes',
      'Kabupaten Cilacap',
      'Kabupaten Demak',
    ],
    'Jawa Timur': [
      'Kabupaten Bangkalan',
      'Kabupaten Bayumangi',
      'Kabupaten Blitar',
      'Kabupaten Bonojonegoro',
      'Kabupaten Bondowoso',
      'Kabupaten Bondowoso',
      'Kabupaten Gresik',
      'Kabupaten Jember',
      'Kabupaten Jombang',
    ]
  };
}
/*
Provinsi: Banten, DKI Jakarta, Jabar, Jateng, Jatim, DIY, 

https://id.wikipedia.org/wiki/Daftar_kabupaten_dan_kota_administrasi_di_Daerah_Khusus_Ibukota_Jakarta
DKI Jakarta:
  Kota Jakarta Barat
  Kota Jakarta Pusat
  Kota Jakarta Selatan
  Kota Jakarta Timur
  Kota Jakarta Utara
  Kabupaten Kepulauan Seribu

https://id.wikipedia.org/wiki/Daftar_kabupaten_dan_kota_di_Banten
Banten:
  Kabupaten Lebak
  Kabupaten Pandeglang
  Kabupaten Serang
  Kabupaten Tanggerang
  Kabupaten Cilegon
  Kota Serang
  Kota Tanggerang
  Kota Selatan Tanggerang

https://id.wikipedia.org/wiki/Daftar_kabupaten_dan_kota_di_Daerah_Istimewa_Yogyakarta
DIY: 
  Kabupaten Bantul
  Kabupaten Gunungkidul
  Kabupaten Kulon Progo
  Kabupaten Sleman
  Kota Yogyakarta

https://id.wikipedia.org/wiki/Daftar_kabupaten_dan_kota_di_Jawa_Barat
Jabar:
  Kabupaten Bandung
  Kabupaten Bandung Barat
  Kabupaten Bekasi
  Kabupaten Bogor
  Kabupaten Ciamis
  Kabupaten Cianjur
  Kabupaten Cirebon
  Kabupaten Garut

https://id.wikipedia.org/wiki/Daftar_kabupaten_dan_kota_di_Jawa_Tengah
Jateng:
  Kabupaten Banjarnegara
  Kabupaten Purwokerto
  Kabupaten Batang
  Kabupaten Biora
  Kabupaten Boyolali
  Kabupaten Brebes
  Kabupaten Cilacap
  Kabupaten Demak

https://id.wikipedia.org/wiki/Daftar_kabupaten_dan_kota_di_Jawa_Timur
Jatim:
  Kabupaten Bangkalan
  Kabupaten Bayumangi
  Kabupaten Blitar
  Kabupaten Bonojonegoro
  Kabupaten Bondowoso
  Kabupaten Bondowoso
  Kabupaten Gresik
  Kabupaten Jember
  Kabupaten Jombang

*/
import 'package:flutter/material.dart';
import 'package:w_vaccine/data/repository/profile_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/auth/page/login_page.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/features/vaccine/view_model/vaccine_view_model.dart';
import 'package:w_vaccine/styles/nofication.dart';
import 'package:provider/provider.dart';

class ChangeAddressViewModel with ChangeNotifier {
  final profileData = getIt.get<ProfileData>();
  final _profileRepo = getIt.get<ProfileRepository>();

  String get address => profileData.address?.address ?? '';
  String get province => profileData.address?.province ?? '';
  String get city => profileData.address?.city ?? '';
  String get postalCode => profileData.address?.postalCode ?? '';

  List<String> get provinces {
    return List.unmodifiable(_region.keys.map((e) => e).toList());
  }

  List<String> cities(String province) {
    return List.unmodifiable(_region[province] ?? ['']);
  }

  void submit({
    required context,
    required AddressData addressData,
  }) async {
    final SharedPref storage = getIt.get<SharedPref>();
    String? token = await storage.readToken();
    if (token == null) {
      snackbarMessage(context, 'Debug Mode - Do not have token');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
    _profileRepo.changeAddress(
      token: token!,
      addressData: addressData,
      onSuccess: (msg) {
        profileData.address = addressData;

        /// Refresh Medical Facility
        Provider.of<VaccineViewModel>(
          context,
          listen: false,
        ).getMedFacilitys(context);
        snackbarMessage(context, msg);
        Navigator.of(context).pop();
      },

      /// Token Expire : Unauthorized
      onError: (msg) {
        snackbarMessage(context, msg);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
    );
  }

  final Map<String, List<String>> _region = {
    'DKI Jakarta': [
      'Jakarta Barat',
      'Jakarta Pusat',
      'Jakarta Selatan',
      'Jakarta Timur',
      'Jakarta Utara',
      'Kepulauan Seribu',
    ],
    'Banten': [
      'Lebak',
      'Pandeglang',
      'Serang',
      'Tanggerang',
      'Cilegon',
      'Serang',
      'Tanggerang',
      'Selatan Tanggerang',
    ],
    'Daerah Istimewa Yogyakarta': [
      'Bantul',
      'Gunungkidul',
      'Kulon Progo',
      'Sleman',
      'Yogyakarta',
    ],
    'Jawa Barat': [
      'Bandung',
      'Bandung Barat',
      'Bekasi',
      'Bogor',
      'Ciamis',
      'Cianjur',
      'Cirebon',
      'Garut',
    ],
    'Jawa Tengah': [
      'Banjarnegara',
      'Purwokerto',
      'Batang',
      'Biora',
      'Boyolali',
      'Brebes',
      'Cilacap',
      'Demak',
    ],
    'Jawa Timur': [
      'Bangkalan',
      'Bayumangi',
      'Blitar',
      'Bonojonegoro',
      'Bondowoso',
      'Bondowoso',
      'Gresik',
      'Jember',
      'Jombang',
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
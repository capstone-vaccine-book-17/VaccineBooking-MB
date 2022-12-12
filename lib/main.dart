import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/auth/view_model/login_view_model.dart';
import 'package:w_vaccine/features/auth/view_model/register_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/add_family_member_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/change_address_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/change_email_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/change_password_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/detail_family_member_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/family_member_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/index_profile_view_model.dart';
import 'package:w_vaccine/features/splash/splash_screen.dart';
import 'package:w_vaccine/features/splash/splash_view_model.dart';
import 'package:w_vaccine/features/vaccine/view_model/session_view_model.dart';
import 'package:w_vaccine/features/vaccine/view_model/vaccine_view_model.dart';
import 'package:w_vaccine/styles/theme.dart';
import 'package:w_vaccine/features/home/view_model/news_view_model.dart';
import 'package:w_vaccine/features/home/view_model/notification_view_model.dart';
import 'package:w_vaccine/features/home/view_model/vaccine_varieties_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(
    MultiProvider(
      providers: [
        /// Splash / Initial
        ChangeNotifierProvider(create: (_) => SplashViewModel()),

        /// Home
        ChangeNotifierProvider(create: (_) => VaccineVaritiesViewModel()),
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
        ChangeNotifierProvider(create: (_) => NotificationViewModel()),

        /// Auth
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),

        /// Profile
        ChangeNotifierProvider(create: (_) => ChangePasswordViewModel()),
        ChangeNotifierProvider(create: (_) => ChangeEmailViewModel()),
        ChangeNotifierProvider(create: (_) => ChangeAddressViewModel()),
        ChangeNotifierProvider(create: (_) => AddFamilyMemberViewModel()),
        ChangeNotifierProvider(create: (_) => IndexProfileViewModel()),
        ChangeNotifierProvider(create: (_) => FamilyMemberViewModel()),
        ChangeNotifierProvider(create: (_) => DetailFamilyMemberViewModel()),

        ///vaccine
        ChangeNotifierProvider(create: (_) => VaccineViewModel()),
        ChangeNotifierProvider(create: (_) => SessionViewModel()),      
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WVaccine',
      debugShowCheckedModeBanner: false,
      theme: testTheme,
      home: const SplashScreen(),
    );
  }
}
/*
Splash Screen Asyncrhonus:
Cek Token di SharedPref
1. Tidak ada 
  -> lempar ke Login
Ada ? Cek expired nya
2. Ada tapi expire 
  -> lempar ke Login
  - HAPUS semua Store untuk Profile dan Family Member jika pake Shared Pref / SQlite
3. Ada tidak expire 
  -> lempar ke Index Navigation
  - Fetch 3 get API untuk profile
  - Store dimana ?? Shared Pref / Sqlite / Provider (Satu provider global / Tersebar di masing2 ViewModel);
  - Fetch Family Member
  - Store dimana ?? Shared Pref / Sqlite / Provider (Satu provider global / Tersebar di masing2 ViewModel);
DONE
*/
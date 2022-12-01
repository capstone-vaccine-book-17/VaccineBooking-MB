import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/index_navigation.dart';
import 'package:w_vaccine/features/profile/page/add_family_member_page.dart';
import 'package:w_vaccine/features/profile/page/change_address_page.dart';
import 'package:w_vaccine/features/profile/view_model/add_family_member_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/change_address_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/change_email_view_model.dart';
import 'package:w_vaccine/features/profile/view_model/change_password_viewmodel.dart';
import 'package:w_vaccine/features/profile/view_model/familydata_viewmodel.dart';
import 'package:w_vaccine/features/profile/view_model/profile_image_viewmodel.dart';
import 'package:w_vaccine/styles/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ObscureSwitcher(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChangeEmailViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChangeAddressViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddFamilyMemberViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileImage(),
        ),
        ChangeNotifierProvider(
          create: (_) => FamilyData(),
        ),
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
      theme: lightTheme,
      // home: const IndexNavigation(),
      home: const ChangeAddressPage(),
    );
  }
}

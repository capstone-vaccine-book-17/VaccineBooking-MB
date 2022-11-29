import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/index_navigation.dart';
import 'package:w_vaccine/features/profile/change_address_view_model.dart';
import 'package:w_vaccine/features/profile/change_email_view_model.dart';
import 'package:w_vaccine/features/profile/change_password_viewmodel.dart';
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
      home: const IndexNavigation(),
    );
  }
}

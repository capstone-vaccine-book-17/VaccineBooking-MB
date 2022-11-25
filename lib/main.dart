import 'package:flutter/material.dart';
import 'package:w_vaccine/features/splash/splash_screen.dart';
import 'package:w_vaccine/styles/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WVaccine',
      debugShowCheckedModeBanner: true,
      theme: lightTheme,
      home: const SplashScreen(),
    );
  }
}

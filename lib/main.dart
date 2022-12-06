import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/home/view_model/news_view_model.dart';
import 'package:w_vaccine/features/home/view_model/notification_view_model.dart';
import 'package:w_vaccine/features/home/view_model/vaccine_varieties_view_model.dart';
import 'package:w_vaccine/features/index_navigation.dart';
import 'package:w_vaccine/styles/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => VaccineVaritiesViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationViewModel(),
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
      debugShowCheckedModeBanner: true,
      theme: lightTheme,
      home: const IndexNavigation(),
    );
  }
}

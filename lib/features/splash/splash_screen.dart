import 'package:flutter/material.dart';
import 'package:w_vaccine/features/splash/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashViewModel vm;

  @override
  void initState() {
    vm = Provider.of<SplashViewModel>(context, listen: false);

    /// Run method on Widget build complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.initialLoad(context);
      // final storage = getIt.get<SharedPref>();
      // storage.readToken();
      // storage.saveToken(
      //     token:
      //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaXRpemVuSUQiOjEsImV4cCI6MTY3MDQ4MzcwOCwibmlrIjoiMzI0NTYyMTQ1Nzg1MzIxNCJ9.mh6MrWcEcOSwCyKkV5hG5KmGSaSiV9SAI30zHPGtiV0');
      // storage.deleteToken();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(80),
        child: Center(
          child: Image.asset('assets/splash.png'),
        ),
      ),
    );
  }
}

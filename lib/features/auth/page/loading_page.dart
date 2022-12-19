import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:w_vaccine/features/index_navigation.dart';

class LoadingToHome extends StatefulWidget {
  const LoadingToHome({super.key});

  @override
  State<LoadingToHome> createState() => _LoadingToHomeState();
}

class _LoadingToHomeState extends State<LoadingToHome> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const IndexNavigation())));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 250),
              Text("Tunggu Sebentar",
                  style: Theme.of(context).textTheme.headline6),
              Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(225),
                  ),
                ),
                child: SizedBox(
                  height: 9,
                  width: 9,
                  child: Lottie.asset("assets/vaccine/loading.json"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

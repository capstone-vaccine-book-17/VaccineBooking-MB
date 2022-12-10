import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPageBookingVaccine extends StatelessWidget {
  const LoadingPageBookingVaccine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 250),
              const Text("Tunggu Sebentar"),
              Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(225),
                  ),
                ),
                child: SizedBox(
                  height: 5,
                  width: 5,
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
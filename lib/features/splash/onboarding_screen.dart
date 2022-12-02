
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/wvaccine.png',
                  width: 150,
                  height: 50,
                ),
                const Text(
                  'Kapan aja dan\n   Dimana aja',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                Image.asset('assets/pana.png'),
                const SizedBox(height: 20),
                const Text(
                  'AYO VAKSIN !',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tak Kenal Maka Tak Kebal',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3366FF),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 60, vertical: 17),
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: const Text('Daftar'),
                    ),
                    const SizedBox(width: 17),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1.5, color: Color(0xff3366FF)),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 60, vertical: 17),
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: const Text('Masuk'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  '\t\t\t\t\t\tDengan menggunakan aplikasi WVaccine\n Kamu menyetujui segala peraturan yang berlaku',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

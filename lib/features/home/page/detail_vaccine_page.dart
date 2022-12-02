import 'package:flutter/material.dart';

class DetailVaccinePage extends StatelessWidget {
  const DetailVaccinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title in here'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 250),
              // constraints: const BoxConstraints(maxHeight: 150),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/POWER.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

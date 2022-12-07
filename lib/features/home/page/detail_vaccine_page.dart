import 'package:flutter/material.dart';
import 'package:w_vaccine/features/home/model/vaccine_model.dart';

class DetailVaccinePage extends StatelessWidget {
  const DetailVaccinePage({super.key, required this.data});

  final VaccineModel data;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 250),
              // constraints: const BoxConstraints(maxHeight: 150),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(data.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(data.description1),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(data.description2),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(data.description3),
            ),
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:w_vaccine/styles/custom_color.dart';

class IndexVaccine extends StatelessWidget {
  const IndexVaccine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Booking Vaccine",
          style: TextStyle(color: blackColor),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/vaccine/ic_back.png",
            height: 15,
            width: 15,
          ),
        ),
      ),
      body: const Center(
        child: Text('Vaccine'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/home/model/vaccine_model.dart';
import 'package:w_vaccine/features/home/view_model/vaccine_varieties_view_model.dart';

class VaccineVarietiesPage extends StatelessWidget {
  const VaccineVarietiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<VaccineVaritiesViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Varietas Vaksin',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var data in vm.vaccines) _cardVariety(data),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardVariety(VaccineModel data) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 76, maxHeight: 76),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(data.image),
                  fit: BoxFit.cover,
                ),
              ),
              // child: const FlutterLogo(size: 76),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(data.type),
                  const SizedBox(height: 4.0),
                  const Text('Description goes here '),
                  Align(
                    heightFactor: 0.5,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Selengkapnya'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

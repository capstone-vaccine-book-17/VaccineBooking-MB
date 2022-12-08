import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w_vaccine/features/home/model/vaccine_model.dart';
import 'package:w_vaccine/features/home/page/detail_vaccine_page.dart';
import 'package:w_vaccine/features/home/view_model/vaccine_varieties_view_model.dart';
import 'package:w_vaccine/styles/custom_color.dart';

class VaccineVarietiesPage extends StatefulWidget {
  const VaccineVarietiesPage({super.key});

  @override
  State<VaccineVarietiesPage> createState() => _VaccineVarietiesPageState();
}

class _VaccineVarietiesPageState extends State<VaccineVarietiesPage> {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [for (var data in vm.vaccines) _cardVariety(data)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardVariety(VaccineModel data) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
                  Text(
                    data.type,
                    style: TextStyle(color: hometopbarclr),
                  ),
                  const SizedBox(height: 4.0),
                  Text(data.description1, maxLines: 1),
                  Align(
                    heightFactor: 0.5,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return DetailVaccinePage(data: data);
                          },
                        ));
                      },
                      child: const Text('See more'),
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

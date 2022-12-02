import 'package:flutter/material.dart';
import 'package:w_vaccine/features/home/model/vaccine_model.dart';

class VaccineVaritiesViewModel with ChangeNotifier {
  List<VaccineModel> get vaccines {
    return [
      VaccineModel(
        name: 'name',
        type: 'type',
        image: 'assets/images/POWER.jpg',
        description: 'description',
      ),
      VaccineModel(
        name: 'name',
        type: 'type',
        image: 'assets/images/POWER.jpg',
        description: 'description',
      ),
    ];
  }
}

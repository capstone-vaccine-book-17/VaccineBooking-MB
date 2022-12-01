import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/model/detail_family_model.dart';

class FamilyData with ChangeNotifier {
  final List<ModelDetailFamily> _datas = const [
    ModelDetailFamily(
      name: 'jarwo',
      nik: '0123456789123456',
      age: '33',
      gender: 'laki-laki',
      relationship: 'ayah',
    ),
    ModelDetailFamily(
      name: 'sopo',
      nik: '987654321987654',
      age: '15',
      gender: 'laki-laki',
      relationship: 'anak',
    ),
    ModelDetailFamily(
      name: 'susan',
      nik: '456798321654321',
      age: '30',
      gender: 'perempuan',
      relationship: 'ibu',
    ),
  ];

  List<ModelDetailFamily> get datas => _datas;

  void add(ModelDetailFamily data) {
    _datas.add(data);
    notifyListeners();
  }
}

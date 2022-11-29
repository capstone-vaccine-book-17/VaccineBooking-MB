import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/detail_family_model.dart';

class FamilyData with ChangeNotifier {
  final List<ModelDetailFamily> _datas = [];

  List<ModelDetailFamily> get datas => _datas;

  void add(ModelDetailFamily data) {
    _datas.add(data);
    notifyListeners();
  }
}

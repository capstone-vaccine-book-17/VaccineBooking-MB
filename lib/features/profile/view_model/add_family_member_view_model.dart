import 'package:flutter/material.dart';
import 'package:w_vaccine/features/profile/model/detail_family_model.dart';
import 'package:w_vaccine/features/profile/view_model/familydata_viewmodel.dart';

class AddFamilyMemberViewModel with ChangeNotifier {
  
  List<String> get genders => List.unmodifiable(['laki-laki', 'perempuan']);
  List<String> get relationships => List.unmodifiable(['ayah', 'ibu', 'anak']);
  void submit({
    required String fullName,
    required String nik,
    required String age,
    required String gender,
    required String relationship,
  }) {
    print(fullName);
    print(nik);
    print(age);
    print(gender);
    print(relationship);
  }

  
}

import 'package:flutter/material.dart';
import 'package:w_vaccine/dependency_injection/family_data.dart';

class AddFamilyMemberViewModel with ChangeNotifier {
  List<String> get genders => List.unmodifiable(['laki-laki', 'perempuan']);

  List<String> get relationships => List.unmodifiable(['ayah', 'ibu', 'anak']);

  void submit({
    required context,
    required FamilyMember familyMember,
  }) {}
}

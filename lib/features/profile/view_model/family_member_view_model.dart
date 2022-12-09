import 'package:flutter/material.dart';
import 'package:w_vaccine/dependency_injection/family_data.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';

class FamilyMemberViewModel with ChangeNotifier {
  final familyData = getIt.get<FamilyData>();

  List<FamilyMember> get family => familyData.family;
}

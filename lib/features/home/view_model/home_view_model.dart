import 'package:flutter/cupertino.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';
import 'package:w_vaccine/dependency_injection/service_locator.dart';

class HomeViewModel with ChangeNotifier {
  final profileData = getIt.get<ProfileData>();

  String? get name => profileData.fullName;
}
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';
import 'dart:io';
import 'dart:async';

import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class IndexProfileViewModel with ChangeNotifier {
  File? image;

  final profileData = getIt.get<ProfileData>();

  String? get name => profileData.fullName;
  String? get nik => profileData.nik;

  Future openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageGallery == null) return;
    image = File(imageGallery.path);
    notifyListeners();
    //1
  }

  void logout(context) async {
    final storage = getIt.get<SharedPref>();
    final String msg = await storage.deleteToken();
    snackbarMessage(context, msg);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      (route) => false,
    );
  }
}

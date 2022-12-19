import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w_vaccine/data/repository/profile_repository.dart';
import 'package:w_vaccine/data/service/local/shared_pref.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';

import 'package:w_vaccine/dependency_injection/service_locator.dart';
import 'package:w_vaccine/features/splash/onboarding_screen.dart';
import 'package:w_vaccine/styles/nofication.dart';

class IndexProfileViewModel with ChangeNotifier {
  final profileData = getIt.get<ProfileData>();
  final _profileRepo = getIt.get<ProfileRepository>();
  final storage = getIt.get<SharedPref>();

  String? get name => profileData.fullName;
  String? get nik => profileData.nik;
  String? get imageURL => profileData.image;
  bool isLoading = false;

  void uploadImage(ImageSource imageSource, context) async {
    final String? token = await storage.readToken();
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      isLoading = true;
      notifyListeners();

      if (pickedFile != null) {
        if (token == null) {
          snackbarMessage(context, 'Debug Mode - Do not have token');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          );
          return;
        }
        var response = await _profileRepo.uploadImage(
            token: token, filePath: pickedFile.path);
        // imageURL = image['data'];
        print(imageURL);

        if (response.statusCode == 200) {
          //get image url from api response
          profileData.image = response.data['data'];
          notifyListeners();
          snackbarMessage(context, 'Image uploaded');
        } else {
          snackbarMessage(context, 'Failed, Error');
        }
      } else {
        snackbarMessage(context, 'Failed, Image not selected');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void logout(context) async {
    final String msg = await storage.deleteToken();
    snackbarMessage(context, msg);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      (route) => false,
    );
  }
}

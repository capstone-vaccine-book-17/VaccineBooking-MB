import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w_vaccine/dependency_injection/profile_data.dart';
import 'dart:io';
import 'dart:async';

import 'package:w_vaccine/dependency_injection/service_locator.dart';

class IndexProfileViewModel with ChangeNotifier {
  File? image;

  final storage = getIt.get<ProfileData>();

  String? get name => storage.fullName;
  String? get nik => storage.nik;

  Future openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageGallery == null) return;
    image = File(imageGallery.path);
    notifyListeners();
    //1
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class ProfileImage with ChangeNotifier {
  File? image;

  Future openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    image = File(imageGallery!.path);
    notifyListeners();
  }
}

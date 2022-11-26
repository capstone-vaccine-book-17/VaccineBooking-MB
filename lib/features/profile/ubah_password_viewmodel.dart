import 'package:flutter/material.dart';

class ObscureSwitcher with ChangeNotifier {
  bool _pwdlama = true;
  bool _pwdbaru = true;
  bool _pwdkonfirm = true;

  bool get pwdlama => _pwdlama;
  bool get pwdbaru => _pwdbaru;
  bool get pwdkonfirm => _pwdkonfirm;

  set pwdlama(bool value) {
    _pwdlama = value;
    notifyListeners();
  }

  set pwdbaru(bool value) {
    _pwdbaru = value;
    notifyListeners();
  }

  set pwdkonfirm(bool value) {
    _pwdkonfirm = value;
    notifyListeners();
  }

  Icon get pwdlamaIcn => (_pwdlama)
      ? const Icon(
          Icons.visibility,
        )
      : const Icon(
          Icons.visibility_off,
        );
  Icon get pwdbruIcn => (_pwdbaru)
      ? const Icon(
          Icons.visibility,
        )
      : const Icon(
          Icons.visibility_off,
        );
  Icon get pwdknfrmIcn => (_pwdkonfirm)
      ? const Icon(
          Icons.visibility,
        )
      : const Icon(
          Icons.visibility_off,
        );
}

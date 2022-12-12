import 'package:flutter/material.dart';

class ChangePasswordViewModel with ChangeNotifier {
  void submit({
    required String oldPass,
    required String newPass,
    required String confirmNewPass,
  }) {}
}

// class ObscureSwitcher with ChangeNotifier {
//   bool _oldpwd = true;
//   bool _newpwd = true;
//   bool _pwdconfirm = true;

//   bool get oldpwd => _oldpwd;
//   bool get newpwd => _newpwd;
//   bool get pwdconfirm => _pwdconfirm;

//   set oldpwd(bool value) {
//     _oldpwd = value;
//     notifyListeners();
//   }

//   set newpwd(bool value) {
//     _newpwd = value;
//     notifyListeners();
//   }

//   set pwdconfirm(bool value) {
//     _pwdconfirm = value;
//     notifyListeners();
//   }

//   Icon get oldpwdIcn => (_oldpwd)
//       ? const Icon(
//           Icons.visibility_off,
//         )
//       : const Icon(
//           Icons.visibility,
//         );
//   Icon get newpwdIcn => (_newpwd)
//       ? const Icon(
//           Icons.visibility_off,
//         )
//       : const Icon(
//           Icons.visibility,
//         );
//   Icon get pwdcnfrmIcn => (_pwdconfirm)
//       ? const Icon(
//           Icons.visibility_off,
//         )
//       : const Icon(
//           Icons.visibility,
//         );
// }

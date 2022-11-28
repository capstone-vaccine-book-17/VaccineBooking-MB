import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  void submit({
    required String email,
    required String pass,
  }) {
    print(email);
    print(pass);
  }
}

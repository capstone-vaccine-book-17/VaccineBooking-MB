import 'package:flutter/material.dart';

class ChangeEmailViewModel with ChangeNotifier {
  void submit({required String email}) {
    print(email);
  }
}

import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  List<String> get genders => List.unmodifiable(['laki-laki', 'perempuan']);

  void submit({
    required String fullName,
    required String nik,
    required String address,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String pass,
  }) {
    // Something to do
    print(fullName);
    print(nik);
    print(address);
    print(gender);
    print(dateOfBirth);
    print(email);
    print(pass);
  }
}

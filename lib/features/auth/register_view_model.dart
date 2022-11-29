import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  final List<String> _genders = ['laki-laki', 'perempuan'];

  List<String> get genders => List.unmodifiable(_genders);

  void submit({
    required String fullName,
    required String nik,
    required String address,
    required String email,
    required String gender,
    required String pass,
  }) {
    // Something to do
    print(fullName);
    print(nik);
    print(address);
    print(email);
    print(gender);
    print(pass);
  }
}

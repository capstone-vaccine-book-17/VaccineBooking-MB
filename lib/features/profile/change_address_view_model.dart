import 'package:flutter/material.dart';

/// City
/// Province

class ChangeAddressViewModel with ChangeNotifier {
  List<String> get cities => List.unmodifiable(['malang']);
  List<String> get provinces => List.unmodifiable(['jakbar']);

  void submit({
    required String newAddress,
    required String city,
    required String province,
    required String postalCode,
  }) {
    print(newAddress);
    print(city);
    print(province);
    print(postalCode);
  }
}

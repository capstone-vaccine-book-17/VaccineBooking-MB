import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color primaryColor = HexColor("A6A5FF");
Color btncolor = HexColor("#3366FF");
Color slctdcolor = HexColor("#0057FF");
Color hometopbarclr = HexColor("#0048d4");

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w_vaccine/styles/custom_color.dart';

/// Light Theme and Dark Theme Toogle
/// https://codeburst.io/managing-multiple-themes-in-flutter-application-37411adeb04c

ThemeData lightTheme = ThemeData.light().copyWith();

ThemeData testTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 21,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 30,
    ),
  ),
  textTheme: TextTheme(
    headline1: GoogleFonts.poppins(
        fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: GoogleFonts.poppins(
        fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: GoogleFonts.poppins(fontSize: 48, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.poppins(
        fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.poppins(
        fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: GoogleFonts.poppins(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.poppins(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(btncolor),
    ),
  ),
);

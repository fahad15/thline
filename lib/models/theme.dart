import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DelivryColor {
  static final purple = Color(0xFF5117AC);
  //static final purple = Color(0xFFD7BA7B);
  //static final green = Color(0xFF20D0C4);
  static final green = Color(0xFFD7BA7B);
  //static final dark = Color(0xFF03091E);
  //static final dark = Color.fromRGBO(58, 66, 86, 1.0);
  static final dark = Color(0xFF35384B);
  static final grey = Color(0xFF212738);
  static final textfild = Color.fromRGBO(244, 243, 243, 1);
  //static final grey = Color.fromRGBO(64, 75, 96, .9);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF5638B);
}

final deliveryGradients = [
  const Color(0xff000005),
  const Color(0xff2196f3),
  //const Color(0x9C51B6),
  // const Color(0X5946B2),
];

final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: DelivryColor.veryLightGrey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: DelivryColor.grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: DelivryColor.purple,
  ),
  canvasColor: DelivryColor.white,
  bottomAppBarColor: DelivryColor.veryLightGrey,
  accentColor: DelivryColor.purple,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DelivryColor.purple,
    displayColor: DelivryColor.purple,
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: _borderLight,
      enabledBorder: _borderLight,
      labelStyle: TextStyle(color: DelivryColor.purple),
      focusedBorder: _borderLight,
      contentPadding: EdgeInsets.zero,
      hintStyle: GoogleFonts.poppins(
        color: DelivryColor.grey,
        fontSize: 10,
      )),
  iconTheme: IconThemeData(
    color: DelivryColor.purple,
  ),
);

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: DelivryColor.purple,
  ),
  bottomAppBarColor: Colors.transparent,
  canvasColor: DelivryColor.grey,
  scaffoldBackgroundColor: DelivryColor.dark,
  accentColor: DelivryColor.white,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DelivryColor.green,
    displayColor: DelivryColor.green,
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: _borderDark,
      enabledBorder: _borderDark,
      labelStyle: TextStyle(color: DelivryColor.white),
      focusedBorder: _borderDark,
      contentPadding: EdgeInsets.zero,
      fillColor: DelivryColor.grey,
      filled: true,
      hintStyle: GoogleFonts.poppins(
        color: DelivryColor.white,
        fontSize: 10,
      )),
  iconTheme: IconThemeData(
    color: DelivryColor.white,
  ),
);

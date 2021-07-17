import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Mythemes {
  static ThemeData lightheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      primaryTextTheme: GoogleFonts.lailaTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darktheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkbluishcolor = Color(0xfff403b58);
}

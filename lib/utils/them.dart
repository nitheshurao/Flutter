import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class Mythemes {
  static ThemeData lightheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      primaryTextTheme: GoogleFonts.lailaTextTheme(),
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkbluishcolor,
      accentColor: darkbluishcolor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darktheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      buttonColor: lighbluishcolor,
      accentColor: Colors.white,
      primaryTextTheme: GoogleFonts.lailaTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme,
        // textTheme: Theme.of(context).textTheme.copyWith(
        //     headline6:
        //         context.textTheme.headline6.copyWith(color: Colors.white)),//to chage text in header bar
        // brightness: Brightness.dark,
      ));
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray600;
  static Color darkbluishcolor = Color(0xfff403b58);
  static Color lighbluishcolor = Vx.purple300;
}

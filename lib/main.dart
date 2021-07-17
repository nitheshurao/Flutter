import 'package:flutter/material.dart';
import 'package:my_app/Pages/Home_page.dart';
import 'package:my_app/Pages/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/utils/routes.dart';
import 'package:my_app/utils/them.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Mythemes.lightheme(context),
      darkTheme: Mythemes.darktheme(context),
      debugShowCheckedModeBanner: false, //to remove deboug banner
      // home: LoginPage(),
      initialRoute: MyRoutes.HomeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.HomeRoute: (context) => Home_page(),
      },
    );
  }
}

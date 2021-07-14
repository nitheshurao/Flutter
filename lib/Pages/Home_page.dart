import 'package:flutter/material.dart';
import 'package:my_app/widgets/drawer.dart';

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Center(
        child: Container(
          child: Text("hi"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

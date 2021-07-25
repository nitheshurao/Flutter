import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String uname = '';

  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;

  moveToHome(BuildContext context) async {
    // if (_formKey.currentState.validate()) {
    setState(() {
      changeButton = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.HomeRoute);
    setState(() {
      changeButton = false;
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Login_Page.png",
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $uname  ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter User Name",
                            labelText: "User name"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username Cant be Emapty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          uname = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "User Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Cant be Emapty";
                          } else if (value.length < 6) {
                            return "Password length should be at least 6";
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  // color: Colors.deepPurple,
                  color: context.theme.buttonColor,
                  borderRadius: BorderRadius.circular(changeButton ? 20 : 8),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    //  async {
                    //   print("Hii");
                    //   setState(() {
                    //     changeButton = true;
                    //   });
                    // await Future.delayed(Duration(seconds: 1));
                    // await Navigator.pushNamed(context, MyRoutes.HomeRoute);
                    // setState(() {
                    //   changeButton = false;
                    // });
                    // },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "LogIn",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                      //   decoration: BoxDecoration(
                      //       color: Colors.deepPurple,)
                    ),
                  ),
                ),

                // ElevatedButton(
                //     onPressed: () {
                //       print("Hii");
                //       Navigator.pushNamed(context, MyRoutes.HomeRoute);
                //     },
                //     child: Text("Login"),
                //     style: TextButton.styleFrom(minimumSize: Size(100, 30)))
              ],
            ),
          ),
        ));
  }
}

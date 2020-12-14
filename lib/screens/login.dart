import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moveto/Http/Http.dart';
import 'package:moveto/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'registration.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  addStringToSF(
    String user_id,
    String user_name,
    String nicename,
    String user_email,
    String user_url,
    String user_registered,
    String user_activation_key,
    // String user_status,
    String display_name,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', user_id);
    prefs.setString('user_name', user_name);
    prefs.setString('nicename', nicename);
    prefs.setString('user_email', user_email);
    prefs.setString('user_url', user_url);
    prefs.setString('user_registered', user_registered);
    prefs.setString('user_activation_key', user_activation_key);
    // prefs.setString('user_status', user_status);
    prefs.setString('display_name', display_name);
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    // String std = prefs.getString('user_id');
    String name = prefs.getString('display_name');
    Fluttertoast.showToast(
        // msg: responseData,
        msg: name,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    final loginText = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Text(
        "Login",
        style: TextStyle(
            fontSize: 35, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final emailField = Container(
      padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: TextField(
        obscureText: false,
        style: style,
        controller: nameController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 10.0),
            labelText: "Email Address",
            hoverColor: Colors.redAccent,
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusColor: Colors.redAccent),
      ),
    );

    final passwordField = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextField(
        obscureText: true,
        style: style,
        decoration: InputDecoration(
          focusColor: Colors.redAccent,
          contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 10.0),
          labelText: "Password",
          labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
        ),
        controller: passwordController,
      ),
    );

    final loginButon = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.redAccent),
        ),
        child: Text(
          'Login',
          textAlign: TextAlign.start,
        ),
        onPressed: () {
          String username = nameController.text;
          String password = passwordController.text;

          final postData = {
            'username': username,
            'password': password,
            'action': 'user_login'
          };

          networkAPICall().httpPostRequest('moveto_api_test.php', postData,
              (status, responseData) {
            if (status) {
              final mainJson = json.decode(responseData);
              String success = mainJson['status'];
              if (success == "true") {
                var response = mainJson['response'];
                var data = response['data'];
                String id = data['ID'];
                String user_login = data['user_login'];
                String user_nicename = data['user_nicename'];
                String user_email = data['user_email'];
                String user_url = data['user_url'];
                String user_registered = data['user_registered'];
                String user_activation_key = data['user_activation_key'];
                // String user_status = data['user_status'];
                String display_name = data['display_name'];

                // print(stringValue);
                addStringToSF(
                  id,
                  user_login,
                  user_nicename,
                  user_email,
                  user_url,
                  user_registered,
                  user_activation_key,
                  // user_status,
                  display_name,
                );
                getStringValuesSF();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );
              }
            } else {
              Fluttertoast.showToast(
                  // msg: responseData,
                  msg: "Please Enter Valid Inputs",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          });
        },
      ),
      alignment: Alignment(1, 0),
    );

    final signupText = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Registration()),
          );
        },
        child: Text(
          "Don't have an account? Sign up",
          style:
              TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
      ),
      alignment: Alignment(1, 1),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: screenHeight(context, dividedBy: 3.7),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/top.png"),
                            fit: BoxFit.fitHeight),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(250, 0, 2, 0),
                        child: Container(
                          // padding: EdgeInsets.only(right: 0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icon.png"),
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0),
            loginText,
            SizedBox(height: 25),
            emailField,
            SizedBox(height: 15.0),
            passwordField,
            SizedBox(height: 15.0),
            loginButon,
            SizedBox(height: 15.0),
            signupText,
            Container(
              height: screenHeight(context, dividedBy: 3.7),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/bottom.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moveto/screens/dashboard.dart';

class Registration extends StatefulWidget {
  Registration({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Registration createState() => _Registration();
}

class _Registration extends State<Registration> {
  TextStyle style1 = TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0);

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  @override
  Widget build(BuildContext context) {
    final registrationText = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Text(
        "Registration",
        style: TextStyle(
            fontSize: 35, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final nameField = Container(
      padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
      child: TextField(
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "FULL NAME",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusColor: Colors.redAccent),
      ),
    );

    final mobileField = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextField(
        obscureText: true,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "Mobile Number",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusColor: Colors.redAccent),
      ),
    );

    final emailaddressField = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextField(
        // obscureText: true,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 5.0),
            labelText: "Email Address",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
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
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "Password",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusColor: Colors.redAccent),
      ),
    );

    final signupButon = Container(
      height: 50,
      padding: EdgeInsets.fromLTRB(0, 10, 30, 0),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.redAccent),
        ),
        child: Text(
          'Sign Up',
          textAlign: TextAlign.start,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ),
          );
        },
      ),
      alignment: Alignment(1, 0),
    );

    final signinText = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text(
          "You Have An Account? Sign in",
          style:
              TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
      ),
      alignment: Alignment(1, 1),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:
          // crossAxisAlignment: CrossAxisAlignment.start,
          SingleChildScrollView(
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
            SizedBox(height: 10),
            registrationText,
            SizedBox(height: 0),
            nameField,
            SizedBox(height: 15.0),
            mobileField,
            SizedBox(height: 15.0),
            emailaddressField,
            SizedBox(height: 15.0),
            passwordField,
            SizedBox(height: 15.0),
            signupButon,
            SizedBox(height: 1),
            signinText,
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

import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  Success({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
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
    final Succesimageview = Container(
      child: Image.asset(
        'assets/successpayment.png',
        width: 300.0,
        height: 300.0,
        fit: BoxFit.fill,
      ),
      alignment: Alignment(0, 1),
    );

    final SuccessfulText = Container(
      padding: EdgeInsets.fromLTRB(18, 20, 0, 0),
      child: Text(
        "Your Order Place Successfully!",
        style: TextStyle(
            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(0, 1),
    );
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        // leading: IconButton(icon: Icon(Icons.menu),color: Colors.white, onPressed: null),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Success Order',
            style: TextStyle(
                fontFamily: 'Arial', fontSize: 20.0, color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.transparent,
                  padding: EdgeInsets.fromLTRB(5, 0, 10, 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  child: Center(
                    child: Wrap(
                      children: <Widget>[
                        Succesimageview,
                        SuccessfulText,
                        SizedBox(
                          height: 300,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

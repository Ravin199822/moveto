import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:moveto/screens/loadingdetails.dart';
import 'package:moveto/screens/location.dart';

class Personaldetails extends StatefulWidget {
  Personaldetails({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Personaldetails createState() => _Personaldetails();
}

class _Personaldetails extends State<Personaldetails> {
  TextStyle style = TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0);

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    final personaldetailText = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Text(
        "Personal Details",
        style: TextStyle(
            fontSize: 25, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final nameField = Container(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: TextField(
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: " Name ",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusColor: Colors.redAccent),
      ),
    );

    final dateField = Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: DateTimeField(
            format: DateFormat("yyyy-MM-dd"),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
            obscureText: false,
            style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
            decoration: InputDecoration(
              fillColor: Colors.redAccent,
                contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
                labelText: " Date ",
                labelStyle:
                    new TextStyle(color: Colors.redAccent, fontSize: 17.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.redAccent),
                ),
                focusColor: Colors.redAccent),
          ),
        ),
      ],
    );

    final emailField = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextField(
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: " Email Id ",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusColor: Colors.redAccent),
      ),
    );

    final mobilenoField = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextField(
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: " Mobile No ",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusColor: Colors.redAccent),
      ),
    );

    final nextButon = Container(
      height: 330,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.red),
        ),
        child: Text(
          '         Next          ',
          textAlign: TextAlign.start,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Location(),
            ),
          );
        },
      ),
      alignment: Alignment(0, 0),
    );

    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Personal Details',
            style: TextStyle(
                fontFamily: 'Arial', fontSize: 20.0, color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  child: Center(
                    child: Wrap(
                      children: <Widget>[
                        personaldetailText,
                        nameField,
                        dateField,
                        emailField,
                        mobilenoField,
                        nextButon,
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

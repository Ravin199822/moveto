import 'package:flutter/material.dart';
import 'package:moveto/screens/success.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class Payment extends StatefulWidget {
  Payment({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Payment createState() => _Payment();
}

class _Payment extends State<Payment> {
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

  @override
  Widget build(BuildContext context) {
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

    final totalPaymenttext = Container(
      padding: EdgeInsets.fromLTRB(18, 10, 10, 0),
      child: new Text(
        "Total Payment",
        style: TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );

    final totalPaymentnumber = Container(
      padding: EdgeInsets.fromLTRB(18, 10, 10, 30),
      child: new Text(
        "289.00",
        style: TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );

    final paylocaltext = Container(
      padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
      child: Text(
        'Pay Local',
        style: TextStyle(
            fontSize: 25, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );

    final debitcredittext = Container(
      padding: EdgeInsets.fromLTRB(0, 22, 0, 22),
      child: Text(
        'Debit/Credit Card',
        style: TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );

    final localCard = Container(
      padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            paylocaltext,
          ],
        ),
      ),
      alignment: Alignment(0, 0),
    );

    final debitcreditcartText = Container(
      width: 150,
      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.redAccent,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[debitcredittext],
        ),
      ),
      alignment: Alignment(0, 0),
    );

    final paylocal = Container(
      padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
      width: 170.0,
      height: 120.0,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Pay Local",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 20.0,
          ),
        ],
      ),
    );

    final debitcard = Container(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
      width: 170.0,
      height: 120.0,
      child: Card(
        color: Colors.redAccent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 35, 10, 10),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Debit/Credit Card",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final choosepaymentopt = Row(
      children: <Widget>[paylocal, debitcard],
    );

    final Cardnumbertext = Container(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: TextField(
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 00.0, 0.0),
            labelText: "Card Number",
            labelStyle: new TextStyle(color: Colors.black, fontSize: 12.0),
            focusColor: Colors.red),
      ),
    );

    final expirydate = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: new DateTimeField(
        format: DateFormat("yyyy-MM"),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 15.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            labelText: " Date ",
            labelStyle: new TextStyle(color: Colors.black, fontSize: 15.0),
            focusColor: Colors.white),
      ),
    );

    final cvvnumber = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
      child: new TextField(
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            labelText: "CVV",
            labelStyle: new TextStyle(color: Colors.black, fontSize: 12.0),
            focusColor: Colors.red),
      ),
    );

    final excvvrow = Container(
      padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: expirydate,
          ),
          new Flexible(
            child: cvvnumber,
          ),
        ],
      ),
    );

    final cardholdername = Container(
      padding: EdgeInsets.fromLTRB(30, 15, 30, 20),
      child: TextField(
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            labelText: "Card Holder",
            labelStyle: new TextStyle(color: Colors.black, fontSize: 12.0),
            focusColor: Colors.red),
      ),
    );

    final secondrow = Row(
      children: <Widget>[expirydate, cvvnumber],
    );

    final Paybutton = Container(
      height: 70,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.red),
        ),
        child: Text(
          'Pay',
          textAlign: TextAlign.start,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Success(),
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
        title: Text('Payment',
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
                totalPaymenttext,
                totalPaymentnumber,
                Container(
                  height: MediaQuery.of(context).size.height - 108,
                  width: MediaQuery.of(context).size.width,
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
                        choosepaymentopt,
                        SizedBox(
                          height: 60,
                        ),
                        Cardnumbertext,
                        SizedBox(
                          height: 60,
                        ),
                        excvvrow,
                        cardholdername,
                        Paybutton,
                        SizedBox(
                          height: 800,
                        )
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

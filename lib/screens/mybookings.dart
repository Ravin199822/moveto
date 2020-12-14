
import 'package:flutter/material.dart';

class Mybookings extends StatefulWidget {
  Mybookings({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Mybookings createState() => _Mybookings();
}

class _Mybookings extends State<Mybookings> {
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

  final List<String> booking_dates = [
    "22 Jul,2019",
    "23 Jul,2019",
    "24 Jul,2019",
    "25 Jul,2019",
    "22 Jul,2019",
    "23 Jul,2019",
    "24 Jul,2019",
    "25 Jul,2019",
    "22 Jul,2019",
    "23 Jul,2019",
    "24 Jul,2019",
    "25 Jul,2019",
    "22 Jul,2019",
    "23 Jul,2019",
    "24 Jul,2019",
    "25 Jul,2019",
  ];

  List<String> source_list = [
    "Surat",
    "Valsad",
    "Surat",
    "Ahmedabad",
    "Surat",
    "Valsad",
    "Surat",
    "Ahmedabad",
    "Surat",
    "Valsad",
    "Surat",
    "Ahmedabad",
    "Surat",
    "Valsad",
    "Surat",
    "Ahmedabad",
  ];
  List<String> destination_list = [
    "NewYark",
    "Pops",
    "Rajkot",
    "Junagadh",
    "NewYark",
    "Pops",
    "Rajkot",
    "Junagadh",
    "NewYark",
    "Pops",
    "Rajkot",
    "Junagadh",
    "NewYark",
    "Pops",
    "Rajkot",
    "Junagadh",
  ];

  @override
  Widget build(BuildContext context) {
    final first_row = Expanded(
      child: ListView.builder(
        itemCount: this.booking_dates.length,
        itemBuilder: (
          _,
          int index,
        ) =>
            datelistDataItem(this.booking_dates[index], this.source_list[index],
                this.destination_list[index]),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.redAccent,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Booking List',
            style: TextStyle(
                fontFamily: 'Arial', fontSize: 20.0, color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 80,
              width: MediaQuery.of(context).size.width,
              //color: Colors.transparent,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),

              child: Column(
                children: <Widget>[
                  first_row,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class datelistDataItem extends StatelessWidget {
  String date;
  String sorce;
  String destination;
  datelistDataItem(this.date, this.sorce, this.destination);

  @override
  Widget build(BuildContext context) {
    final sorce_name = Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Text(
        sorce,
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final destination_name = Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Text(
        destination,
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final booking_date_text = Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Text(
        "Booking Date: ",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final booking_date = Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Text(
        date,
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final to_text = Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Text(
        "To",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    return new Card(
      child: Column(
        children: [
          Row(
            children: <Widget>[booking_date_text, booking_date],
          ),
          Row(
            children: <Widget>[sorce_name, to_text, destination_name],
          ),
        ],
      ),
    );
  }
}

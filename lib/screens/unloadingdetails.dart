import 'package:flutter/material.dart';
import 'package:moveto/screens/estimatedcost.dart';
import 'package:moveto/widgets/UnloadingFloorno.dart';

class UnloadingDetails extends StatefulWidget {
  UnloadingDetails({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UnloadingDetails createState() => _UnloadingDetails();
}

class _UnloadingDetails extends State<UnloadingDetails> {
  TextStyle style = TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0);

  bool iselevatorswitch = true;
  bool isunpackingswitch = true;
  bool ispackmaterialswitch = true;
  bool isfriskmaterialswitch = true;

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          color: Colors.redAccent, //                   <--- border color
          width: 3.0),
      borderRadius: BorderRadius.all(
        Radius.circular(7.0), //                 <--- border radius here
      ),
    );
  }

  BoxDecoration myRedBoxDecoration() {
    return BoxDecoration(
      color: Colors.redAccent,
      border: Border.all(
          color: Colors.redAccent, // set border color
          width: 3.0),
      borderRadius: BorderRadius.all(
        Radius.circular(7.0), //                 <--- border radius here
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final floornoText = Container(
      padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
      child: Text(
        "Floor No",
        style: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final addressText = Container(
      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
      child: Text(
        "Address",
        style: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final streetField = Container(
      padding: EdgeInsets.fromLTRB(10, 7, 10, 0),
      child: TextField(
        // obscureText: true,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 5.0),
            labelText: " Street ",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );

    final cityField = Container(
      padding: EdgeInsets.fromLTRB(10, 7, 10, 0),
      child: TextField(
        // obscureText: true,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 5.0),
            labelText: " City ",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );

    final stateField = Container(
      padding: EdgeInsets.fromLTRB(10, 7, 10, 0),
      child: TextField(
        // obscureText: true,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 5.0),
            labelText: " State ",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );

    final elevatorText = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        "Elevator?",
        style: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal),
        textAlign: TextAlign.left,
      ),
      // alignment: Alignment(-1, 0),
    );

    final elevatorSwitch = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Switch(
        value: iselevatorswitch,
        onChanged: (value) {
          setState(() {
            iselevatorswitch = value;
            print(iselevatorswitch);
          });
        },
        activeTrackColor: Colors.redAccent,
        activeColor: Colors.redAccent,
      ),
      alignment: Alignment.topRight,
    );

    final firstelevatorSwitch = Container(
      padding: EdgeInsets.fromLTRB(18, 35, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: elevatorText,
          ),
          new Flexible(
            child: elevatorSwitch,
          ),
        ],
      ),
    );

    final packagingText = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        "Packaging ?",
        style: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal),
        textAlign: TextAlign.left,
      ),
    );

    final packagingSwitch = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Switch(
        value: isunpackingswitch,
        onChanged: (value) {
          setState(() {
            isunpackingswitch = value;
            print(isunpackingswitch);
          });
        },
        activeTrackColor: Colors.redAccent,
        activeColor: Colors.redAccent,
      ),
      alignment: Alignment.topRight,
    );

    final secondpackagingSwitch = Container(
      padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: packagingText,
          ),
          new Flexible(
            child: packagingSwitch,
          ),
        ],
      ),
    );

    final additionalinfoText = Container(
      padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
      child: Text(
        "Additional Information",
        style: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final packmaterialText = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        "Packaging material from us ?",
        style: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.normal),
        textAlign: TextAlign.left,
      ),
    );

    final packmaterialSwitch = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Switch(
        value: ispackmaterialswitch,
        onChanged: (value) {
          setState(() {
            ispackmaterialswitch = value;
            print(ispackmaterialswitch);
          });
        },
        activeTrackColor: Colors.redAccent,
        activeColor: Colors.redAccent,
      ),
      alignment: Alignment.topRight,
    );

    final thirdpackmaterialSwitch = Container(
      padding: EdgeInsets.fromLTRB(18, 5, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: packmaterialText,
          ),
          new Flexible(
            child: packmaterialSwitch,
          ),
        ],
      ),
    );

    final friskmaterialText = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        "Is material frisking ?",
        style: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.normal),
        textAlign: TextAlign.left,
      ),
    );

    final friskmaterialSwitch = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Switch(
        value: isfriskmaterialswitch,
        onChanged: (value) {
          setState(() {
            isfriskmaterialswitch = value;
            print(isfriskmaterialswitch);
          });
        },
        activeTrackColor: Colors.redAccent,
        activeColor: Colors.redAccent,
      ),
      alignment: Alignment.topRight,
    );

    final forthfriskmaterialSwitch = Container(
      padding: EdgeInsets.fromLTRB(18, 5, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: friskmaterialText,
          ),
          new Flexible(
            child: friskmaterialSwitch,
          ),
        ],
      ),
    );

    final nextButton = Container(
      height: 80,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.red),
        ),
        child: Text(
          '         Next         ',
          textAlign: TextAlign.start,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EstimatedCost(),
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
        title: Text('Unloading Details',
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Wrap(
                      children: <Widget>[
                        floornoText,
                        UnloadingFloorListView(),
                        addressText,
                        streetField,
                        cityField,
                        stateField,
                        firstelevatorSwitch,
                        secondpackagingSwitch,
                        additionalinfoText,
                        thirdpackmaterialSwitch,
                        forthfriskmaterialSwitch,
                        nextButton,
                        SizedBox(height: 20),
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

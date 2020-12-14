import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moveto/Http/Http.dart';
import 'package:moveto/widgets/LoadingFloorno.dart';
import 'unloadingdetails.dart';

class LoadingDetails extends StatefulWidget {
  LoadingDetails({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoadingDetails createState() => _LoadingDetails();
}

class _LoadingDetails extends State<LoadingDetails> {
  TextStyle style = TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0);

  bool zeroFloorlight = false;
  bool firstFloorlight = true;
  bool secondFloorlight = false;
  bool thirdFloorlight = false;
  bool forthFloorlight = false;
  bool fifthFloorlight = false;

  bool iselevatorSwitch = true;
  bool ispackagingswitch = true;
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
        value: iselevatorSwitch,
        onChanged: (value) {
          setState(() {
            iselevatorSwitch = value;
            print(iselevatorSwitch);
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
        value: ispackagingswitch,
        onChanged: (value) {
          setState(() {
            ispackagingswitch = value;
            print(ispackagingswitch);
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
            if (ispackmaterialswitch) {
              final postData = {'action': 'get_additional_info'};

              networkAPICall().httpPostRequest('moveto_api_test.php', postData,
                  (status, responseData) {
                if (status) {
                  final mainJson = json.decode(responseData);
                  String success = mainJson['status'];
                  if (success == "true") {
                    var response = mainJson['response'];
                    print("response        "+response.length.toString());
                    for(int i=0;i<response.length;i++){
                      var switchsData=response[i];
                      print(switchsData['price']);
                    }


                  }
                }
              });

              print(ispackmaterialswitch);
            } else {
              print("fals");
            }
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
              builder: (context) => UnloadingDetails(),
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
        title: Text('Loading Details',
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
                        FloorListView(),
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

// final zerofloorButton = InkWell(
//   onTap: () {
//     setState(
//       () {
//         zeroFloorlight = true;
//         firstFloorlight = false;
//         secondFloorlight = false;
//         thirdFloorlight = false;
//         forthFloorlight = false;
//         fifthFloorlight = false;
//       },
//     );
//   },
//   child: Container(
//     margin: const EdgeInsets.all(8.0),
//     padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
//     decoration: zeroFloorlight
//         ? myBoxDecoration()
//         : myRedBoxDecoration(), //             <--- BoxDecoration here
//     child: Text(
//       " 0 ",
//       style: TextStyle(
//           fontSize: 15.0,
//           color: zeroFloorlight ? Colors.red : Colors.white),
//     ),
//   ),
// );
//
// final firstfloorButton = InkWell(
//   onTap: () {
//     setState(
//       () {
//         zeroFloorlight = false;
//         firstFloorlight = true;
//         secondFloorlight = false;
//         thirdFloorlight = false;
//         forthFloorlight = false;
//         fifthFloorlight = false;
//       },
//     );
//   },
//   child: Container(
//     margin: const EdgeInsets.all(8.0),
//     padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
//     decoration: firstFloorlight
//         ? myBoxDecoration()
//         : myRedBoxDecoration(), //             <--- BoxDecoration here
//     child: Text(
//       " 1 ",
//       style: TextStyle(
//           fontSize: 15.0,
//           color: firstFloorlight ? Colors.red : Colors.white),
//     ),
//   ),
// );
//
// final secondfloorButton = InkWell(
//   onTap: () {
//     setState(
//       () {
//         zeroFloorlight = false;
//         firstFloorlight = false;
//         secondFloorlight = true;
//         thirdFloorlight = false;
//         forthFloorlight = false;
//         fifthFloorlight = false;
//       },
//     );
//   },
//   child: Container(
//     margin: const EdgeInsets.all(8.0),
//     padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
//     decoration: secondFloorlight
//         ? myBoxDecoration()
//         : myRedBoxDecoration(), //             <--- BoxDecoration here
//     child: Text(
//       " 2 ",
//       style: TextStyle(
//           fontSize: 15.0,
//           color: secondFloorlight ? Colors.red : Colors.white),
//     ),
//   ),
// );
//
// final thirdfloorButton = InkWell(
//   onTap: () {
//     setState(
//       () {
//         zeroFloorlight = false;
//         firstFloorlight = false;
//         secondFloorlight = false;
//         thirdFloorlight = true;
//         forthFloorlight = false;
//         fifthFloorlight = false;
//       },
//     );
//   },
//   child: Container(
//     margin: const EdgeInsets.all(8.0),
//     padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
//     decoration: thirdFloorlight
//         ? myBoxDecoration()
//         : myRedBoxDecoration(), //             <--- BoxDecoration here
//     child: Text(
//       " 3 ",
//       style: TextStyle(
//           fontSize: 15.0,
//           color: thirdFloorlight ? Colors.red : Colors.white),
//     ),
//   ),
// );
//
// final forthfloorButton = InkWell(
//   onTap: () {
//     setState(
//       () {
//         zeroFloorlight = false;
//         firstFloorlight = false;
//         secondFloorlight = false;
//         thirdFloorlight = false;
//         forthFloorlight = true;
//         fifthFloorlight = false;
//       },
//     );
//   },
//   child: Container(
//     margin: const EdgeInsets.all(8.0),
//     padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
//     decoration: forthFloorlight
//         ? myBoxDecoration()
//         : myRedBoxDecoration(), //             <--- BoxDecoration here
//     child: Text(
//       " 4 ",
//       style: TextStyle(
//           fontSize: 15.0,
//           color: forthFloorlight ? Colors.red : Colors.white),
//     ),
//   ),
// );
//
// final fifthfloorButton = InkWell(
//   onTap: () {
//     setState(
//       () {
//         zeroFloorlight = false;
//         firstFloorlight = false;
//         secondFloorlight = false;
//         thirdFloorlight = false;
//         forthFloorlight = false;
//         fifthFloorlight = true;
//       },
//     );
//   },
//   child: Container(
//     margin: const EdgeInsets.all(8.0),
//     padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
//     decoration: fifthFloorlight
//         ? myBoxDecoration()
//         : myRedBoxDecoration(), //             <--- BoxDecoration here
//     child: Text(
//       " 5 ",
//       style: TextStyle(
//           fontSize: 15.0,
//           color: fifthFloorlight ? Colors.red : Colors.white),
//     ),
//   ),
// );

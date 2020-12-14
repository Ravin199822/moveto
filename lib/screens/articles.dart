import 'package:flutter/material.dart';
import 'personaldetail.dart';
import 'package:moveto/widgets/MoveSize.dart';
import 'package:moveto/widgets/RoomType.dart';
import 'package:moveto/globals.dart' as globals;

class Articles extends StatefulWidget {
  Articles({Key key, this.title}) : super(key: key);
  final String title;

  // final Future<List> quiz;

  @override
  _Articles createState() => _Articles();
}

class _Articles extends State<Articles> {
  final postData = {"action": "get_movesize"};
  TextStyle style = TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0);
  var selectedCard = 'WEIGHT';
  var selectedCard1 = 'WEIGHT';
  bool showBedroom = true;
  bool showCustom = false;
  bool showLivingroom = false;
  bool showVehicle = false;
  bool showKitchen = false;

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
    // jsonFetchingMovesizeData();
    final movesizeText = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: Text(
        "Move Size",
        style: TextStyle(
            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final articlesText = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: Text(
        "Articles",
        style: TextStyle(
            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final customText = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: Text(
        "Custom",
        style: TextStyle(
            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final nextButton = Container(
      height: 80,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
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
          globals.CountedItem.totalvolume = 0;
          //bedroom
          int globalbedfurlength =
              globals.CountedItem.bedroomfurnitureglobal.length;
          int globalbedelelength =
              globals.CountedItem.bedroomelectronicsglobal.length;
          for (int i = 0; i < globalbedfurlength; i++) {
//              print("105 name"+globals.CountedItem.bedroomfurnitureglobal[i].articleName);
//              print("105 cunbicarea"+globals.CountedItem.bedroomfurnitureglobal[i].cubicarea);
//              print("106 qty"+globals.CountedItem.bedroomfurnitureglobal[i].qty.toString());
//              print("107 price"+globals.CountedItem.bedroomfurnitureglobal[i].price);

            globals.CountedItem.totalvolume = globals.CountedItem.totalvolume +
                int.parse(
                    globals.CountedItem.bedroomfurnitureglobal[i].cubicarea);
          }
          for (int i = 0; i < globalbedelelength; i++) {
            globals.CountedItem.totalvolume = globals.CountedItem.totalvolume +
                int.parse(
                    globals.CountedItem.bedroomelectronicsglobal[i].cubicarea);
          }

          //
          //livingroom
          int globallivfurlength =
              globals.CountedItem.livingroomfurnitureglobal.length;
          int globallivelelength =
              globals.CountedItem.livingroomelectronicsglobal.length;
          for (int i = 0; i < globallivfurlength; i++) {
            globals.CountedItem.totalvolume = globals.CountedItem.totalvolume +
                int.parse(
                    globals.CountedItem.livingroomfurnitureglobal[i].cubicarea);
          }
          for (int i = 0; i < globallivelelength; i++) {
            globals.CountedItem.totalvolume = globals.CountedItem.totalvolume +
                int.parse(globals
                    .CountedItem.livingroomelectronicsglobal[i].cubicarea);
          }

          //
          //kitchen
          int globalkitfurlength =
              globals.CountedItem.kitchenfurnitureglobal.length;
          int globalkitelelength =
              globals.CountedItem.kitchenelectronicsglobal.length;
          for (int i = 0; i < globalkitfurlength; i++) {
            globals.CountedItem.totalvolume = globals.CountedItem.totalvolume +
                int.parse(
                    globals.CountedItem.kitchenfurnitureglobal[i].cubicarea);
          }
          for (int i = 0; i < globalkitelelength; i++) {
            globals.CountedItem.totalvolume = globals.CountedItem.totalvolume +
                int.parse(
                    globals.CountedItem.kitchenelectronicsglobal[i].cubicarea);
          }

          //
          //vehicle
          int globalvehiclelength = globals.CountedItem.vehicleglobal.length;
          for (int i = 0; i < globalvehiclelength; i++) {
            globals.CountedItem.totalvolume = globals.CountedItem.totalvolume +
                int.parse(globals.CountedItem.vehicleglobal[i].cubicarea);
          }

          //custom
          int globalcustomlength = globals.CountedItem.customglobal.length;

          for (int i = 0; i < globalcustomlength; i++) {
            globals.CountedItem.totalvolume = globals.CountedItem.totalvolume +
                int.parse(globals.CountedItem.customglobal[i].cubicarea);
          }

          print("116  total volume " +
              globals.CountedItem.totalvolume.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Personaldetails(),
            ),
          );
        },
      ),
      alignment: Alignment(0, 0),
    );

    final titleField = Container(
      padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
      child: TextField(
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "Title",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusColor: Colors.red),
      ),
    );

    final heightField = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextField(
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "Height",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusColor: Colors.red),
      ),
    );

    final widthField = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextField(
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "Width",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusColor: Colors.red),
      ),
    );

    final lengthField = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextField(
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "Length",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusColor: Colors.red),
      ),
    );

    final customContainer = Column(
      children: <Widget>[
        customText,
        titleField,
        heightField,
        widthField,
        lengthField,
        SizedBox(
          height: 50,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Articles',
            style: TextStyle(
                fontFamily: 'Arial', fontSize: 20.0, color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  child: Center(
                    child: Wrap(
                      children: <Widget>[
                        movesizeText,
                        ModelListView(),
                        articlesText,
                        ModelRoomListView(),
                        nextButton,
                        SizedBox(height: 50),
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
//
// List<ModelBean> jsonFetchingMovesizeData() {
//   final postData = {"action": "get_movesize"};
//
//   networkAPICall().httpPostRequest('moveto_api_test.php', postData,
//       (status, responseData) {
//     if (status) {
//       final mainJson = json.decode(responseData);
//       var response = mainJson['response'];
//       var tagObjsJson = jsonDecode(responseData)['response'] as List;
//       List<ModelBean> tagObjs =
//           tagObjsJson.map((tagJson) => ModelBean.fromJson(tagJson)).toList();
//     }
//   });
// }

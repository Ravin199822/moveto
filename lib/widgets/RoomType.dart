import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moveto/model/ArticleRoomModelBean.dart';
import 'package:moveto/model/Articles_All_Model.dart';
import 'package:moveto/widgets/ArticleSize.dart';
import 'package:moveto/widgets/ElectronicWidgets.dart';
import 'package:moveto/widgets/KitchenFurnitureSlider.dart';
import 'package:moveto/widgets/LivingroomElectronicSlider.dart';
import 'package:moveto/widgets/LivingroomFurnitureSlider.dart';
import 'package:moveto/widgets/vehiclesSlider.dart';
import 'package:moveto/globals.dart' as globals;


import 'KitchenElectricSlider.dart';

class ModelRoomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BodyWidget();
  }
}

class BodyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BodyWidgetState();
}

class BodyWidgetState extends State<BodyWidget>
    with SingleTickerProviderStateMixin<BodyWidget> {
  var _roomcall;
  List<ArticleAllModelResponse> selecteditemObjects =
      List<ArticleAllModelResponse>();

  @override
  void initState() {
    super.initState();
    _roomcall = _fetchRooms();
  }

  bool isSelected = false;
  bool showBedroom = false;
  bool showCustom = false;
  bool showLivingroom = false;
  bool showVehicle = false;
  bool showKitchen = false;

  var titleController=TextEditingController();
  var heightController=TextEditingController();
  var widthController=TextEditingController();
  var lengthController=TextEditingController();
  ArticleAllModelResponse customdata;

  List<ArticleRoomModelBean> roomModel = List<ArticleRoomModelBean>();

  Future<List<ArticleRoomModelBean>> _fetchRooms() async {
    final http.Response response = await http.post(
      'http://skymoonlabs.com/moveto/demo/wp-content/plugins/moveto/api/moveto_api_test.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'action': "get_room_type_front",
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var status = json.decode(response.body)['status'];
      if (status == "true") {
        var tagObjsJson = jsonDecode(response.body)['response'] as List;
        roomModel = tagObjsJson
            .map((tagJson) => ArticleRoomModelBean.fromJson(tagJson))
            .toList();
//        for(int i=0;i<roomModel.length;i++)
//          {
//            print(roomModel[i].id);
//          }
        return roomModel;
      } else {
        return null;
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Container _ModelRoomListView(data, int i) {
    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        border: Border.all(
            color: Colors.white, //                   <--- border color
            width: 0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0), //                 <--- border radius here
        ),
      );
    }

    BoxDecoration myRedBoxDecoration() {
      return BoxDecoration(
        color: Colors.redAccent,
        border: Border.all(
            color: Colors.white, // set border color
            width: 0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(7.0), //                 <--- border radius here
        ),
      );
    }

    final customButton = Container(
      height: 50,
      child: InkWell(
        splashColor: Colors.yellow,
        highlightColor: Colors.blue,
        onTap: () {
          for (int j = 0; j < data.length; j++) {
            print(data[j].id);
            if ((data[j].id).contains('isclciked')) {
              data[j].id = (data[j].id).replaceAll('isclciked', '');
            }
          }
          setState(() {
            showBedroom = false;
            showLivingroom = false;
            showKitchen = false;
            showVehicle = false;
            showCustom = true;
          });
        },
        child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
          decoration: showCustom ? myRedBoxDecoration() : myBoxDecoration(),
          width: MediaQuery.of(context).size.width * 0.25,
          child: Card(
            color: showCustom ? Colors.white : Colors.redAccent,
            child: Container(
              height: 20,
              child: Center(
                child: _customtile("Custom", "custom"),
              ),
            ),
          ),
        ),
      ),
    );

    final heightField = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextField(
        controller: heightController,
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "Height",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusColor: Colors.redAccent),
      ),
    );

    final titleField = Container(
      padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
      child: TextField(
        controller: titleController,
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "Title",
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

    final widthField = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextField(
        controller: widthController,
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "Width",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusColor: Colors.redAccent),
      ),
    );

    final lengthField = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: TextField(
        controller: lengthController,
        obscureText: false,
        style: TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
            labelText: "Length",
            labelStyle: new TextStyle(color: Colors.redAccent, fontSize: 17.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusColor: Colors.redAccent),
      ),
    );

    final addbutton = Container(
      height: 80,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: RaisedButton(
        textColor: Colors.red,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white),
        ),
        child: Text(
          'add',
          textAlign: TextAlign.start,
        ),
        onPressed: () {
          print("pressed");
          print(titleController.text);
          print(widthController.text);
          print(lengthController.text);
          print(heightController.text);
          var cubicarea=((int.parse(widthController.text))*(int.parse(lengthController.text))*(int.parse(heightController.text)));
          customdata=ArticleAllModelResponse();
          customdata.articleName=titleController.text;
          customdata.cubicarea=cubicarea.toString();
          customdata.qty=1;
          print(cubicarea);
          globals.CountedItem.customglobal.add(customdata);
          },
      ),
      alignment: Alignment(0, 0),
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

    final articlebuttons = new Flexible(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              child: ListView.builder(
                itemCount: data.length + 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                primary: false,
                itemBuilder: (context, index) {
                  // checking if the index item is the last item of the list or not
                  if (index == data.length) {
                    return customButton;
                  }
                  return InkWell(
                    onTap: () {
                      // (context as Element).markNeedsBuild();
                      for (int i = 0; i < data.length; i++) {
                        if ((data[i].id).contains('isclciked')) {
                          data[i].id = (data[i].id).replaceAll('isclciked', '');
                        }
                      }
                      print(data[index].id);
                      data[index].id += "isclciked";
                      print(data[index].id);
                      for (int i = 0; i < data.length; i++) {
                        if ((data[i].id) != data[index].id) if ((data[i].id)
                            .contains('isclciked')) {
                          data[i].id = (data[i].id).replaceAll('isclciked', '');
                        }
                      }
                      setState(() {
                        if (data[index].id == "1isclciked") {
                          showBedroom = true;
                          showLivingroom = false;
                          showKitchen = false;
                          showVehicle = false;
                          showCustom = false;
                        } else if (data[index].id == "2isclciked") {
                          showBedroom = false;
                          showLivingroom = true;
                          showKitchen = false;
                          showVehicle = false;
                          showCustom = false;
                        } else if (data[index].id == "3isclciked") {
                          showBedroom = false;
                          showLivingroom = false;
                          showKitchen = true;
                          showVehicle = false;
                          showCustom = false;
                        } else if (data[index].id == "4isclciked") {
                          showBedroom = false;
                          showLivingroom = false;
                          showKitchen = false;
                          showVehicle = true;
                          showCustom = false;
                        }
                        else{
                          showBedroom = false;
                          showLivingroom = false;
                          showKitchen = false;
                          showVehicle = false;
                          showCustom = false;
                        }
                      });
                      // String index;
                    },
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 500),
                      decoration: (data[index].id).contains('isclciked')
                          ? myRedBoxDecoration()
                          : myBoxDecoration(),
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Card(
                        color: (data[index].id).contains('isclciked')
                            ? Colors.white
                            : Colors.redAccent,
                        child: Container(
                          child: Center(
                            child: _tile(data[index].name, data[index].id),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    final bedroomText = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: Text(
        "Bedroom",
        style: TextStyle(
            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final LivingRoomText = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: Text(
        "Livingroom",
        style: TextStyle(
            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final KitchenText = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: Text(
        "Kitchen",
        style: TextStyle(
            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final VehiclesText = Container(
      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: Text(
        "Vehicles",
        style: TextStyle(
            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final furnitureText = Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Text(
        "Furniture",
        style: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final electronicText = Container(
      padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
      child: Text(
        "Electronic",
        style: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final bedroomcontainer = Container(
      height: 450,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: <Widget>[
          bedroomText,
          furnitureText,
          ArticleListView(),
          electronicText,
          ArticleElectronicsListView(),
        ],
      ),
      // ),
    );

    final livingroomcontainer = Container(
      height: 450,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: <Widget>[
          LivingRoomText,
          furnitureText,
          LivingroomFurnitureListView(),
          electronicText,
          LivingRoomElectronicsListView(),
        ],
      ),
    );

    final kitchencontainer = Container(
      height: 450,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: <Widget>[
          KitchenText,
          furnitureText,
          KitchenFurnitureListView(),
          electronicText,
          KitchenElectronicsListView(),
        ],
      ),
      // ),
    );

    final vehiclecontainer = Container(
      height: 450,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: <Widget>[
          VehiclesText,
          // furniturText,
          VehicleListView(),
          // electronicText,
          // KitchenElectronicsListView(),
        ],
      ),
      // ),
    );
    final customContainer = Container(
      height: 450,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: <Widget>[
          customText,
          titleField,
          heightField,
          widthField,
          lengthField,
          addbutton,
        ],
      ),
    );

    return new Container(
      height: 490,
      child: Column(
        children: <Widget>[
          articlebuttons,
          showBedroom
              ? bedroomcontainer
              : showLivingroom
                  ? livingroomcontainer
                  : showKitchen
                      ? kitchencontainer
                      : showVehicle
                          ? vehiclecontainer
                          : showCustom
                              ? customContainer
                              : SizedBox(
                                  height: 80,
                                )
        ],
      ),
    );
  }

  AutoSizeText _tile(String title, String id) => AutoSizeText(
        title,
        maxLines: 1,
        style: TextStyle(
          fontSize: 14,
          color: id.contains('isclciked') ? Colors.redAccent : Colors.white,
        ),
      );

  AutoSizeText _customtile(String title, String id) => AutoSizeText(
        title,
        maxLines: 1,
        style: TextStyle(
          fontSize: 14,
          color: showCustom ? Colors.redAccent : Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleRoomModelBean>>(
      future: _roomcall,
      builder: (context, snapshot) {
        List<ArticleRoomModelBean> data = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 7,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
            ));
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return _ModelRoomListView(data, data.length);
        }
      },
    );
  }
}

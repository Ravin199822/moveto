import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moveto/globals.dart' as globals;
import 'package:moveto/model/Articles_All_Model.dart';

import 'Bedroomdatalist.dart';
import 'Kitchendatalist.dart';
import 'Livingroomdatalist.dart';
import 'Vehiclesdatalist.dart';

class EstimatedSelectedItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EstimatedSelectedItemsBodyWidget();
  }
}

class EstimatedSelectedItemsBodyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _EstimatedSelectedItemsBodyWidgetState();
}

class _EstimatedSelectedItemsBodyWidgetState
    extends State<EstimatedSelectedItemsBodyWidget> {
  bool isbedroom = false;
  bool islivingroom = false;
  bool iskitchen = false;
  bool isvehicle = false;
  bool iscustom = false;

  Container _ModelItemView() {
    Fluttertoast.showToast(
        msg: "bedroom".toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    return new Container(
      padding: EdgeInsets.fromLTRB(18, 5, 10, 0),
      child: Row(),
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    //bedroom
    List<ArticleAllModelResponse> bedroomfuritems =
        globals.CountedItem.bedroomfurnitureglobal;
    List<ArticleAllModelResponse> bedroomeleitems =
        globals.CountedItem.bedroomelectronicsglobal;
    List<ArticleAllModelResponse> bedroom = bedroomfuritems + bedroomeleitems;
    print("Bedroom items==" + bedroom.toString());
    bedroom = bedroom.toSet().toList();
    print("Bedroom distinct items==" + bedroom.toString());

    //
    //livingroom
    List<ArticleAllModelResponse> livingroomfuritems =
        globals.CountedItem.livingroomfurnitureglobal;
    List<ArticleAllModelResponse> livingroomeleitems =
        globals.CountedItem.livingroomelectronicsglobal;
    List<ArticleAllModelResponse> livingroom =
        livingroomfuritems + livingroomeleitems;
    print("LivingRoom items==" + livingroom.toString());
    livingroom = livingroom.toSet().toList();
    print("livingroom distinct items==" + livingroom.toString());

    //
    //kitchen
    List<ArticleAllModelResponse> kitchenfuritems =
        globals.CountedItem.kitchenfurnitureglobal;
    List<ArticleAllModelResponse> kitcheneleitems =
        globals.CountedItem.kitchenelectronicsglobal;
    List<ArticleAllModelResponse> kitchen = kitchenfuritems + kitcheneleitems;
    print("Kitchen items==" + kitchen.toString());
    kitchen = kitchen.toSet().toList();
    print("kitchen distinct items==" + kitchen.toString());

    //
    //vehicle
    List<ArticleAllModelResponse> vehicles = globals.CountedItem.vehicleglobal;
    print("vehicle items==" + vehicles.toString());
    vehicles = vehicles.toSet().toList();
    print("vehicles distinct items==" + vehicles.toString());


    //custom
    List<ArticleAllModelResponse> customs = globals.CountedItem.customglobal;
    print("custom items==" + customs.toString());
    customs = customs.toSet().toList();
    print("custom distinct items==" + customs.toString());

    if (bedroom.isNotEmpty) {
      isbedroom = true;
    }

    if (livingroom.isNotEmpty) {
      islivingroom = true;
    }

    if (kitchen.isNotEmpty) {
      iskitchen = true;
    }

    if (vehicles.isNotEmpty) {
      isvehicle = true;
    }

    if(customs.isNotEmpty){
      iscustom=true;
    }

    final bedroom_text = Container(
      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
      child: Text(
        "Bedroom",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final livingroom_text = Container(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
      child: Text(
        "Living Room",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final kitchen_text = Container(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
      child: Text(
        "Kitchen",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final vehicle_text = Container(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
      child: Text(
        "Vehicles",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final custom_text = Container(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
      child: Text(
        "Custom",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final bedroom_rows = Container(
      height: 50,
      child: Scrollbar(
        child: ListView.builder(
//        scrollDirection:null,
          itemCount: bedroom.length,
          itemBuilder: (
            _,
            int index,
          ) =>
              bedroomlistDataItem(
                  bedroom[index].articleName, bedroom[index].qty),
        ),
      ),
    );

    final livingroom_rows = Container(
      height: 50,
      child: Scrollbar(
        child: ListView.builder(
//        scrollDirection:null,
          itemCount: livingroom.length,
          itemBuilder: (
            _,
            int index,
          ) =>
              livingroomlistDataItem(
                  livingroom[index].articleName, livingroom[index].qty),
        ),
      ),
    );

    final kitchen_rows = Container(
      height: 50,
      child: Scrollbar(
        child: ListView.builder(
//        scrollDirection:null,
          itemCount: kitchen.length,
          itemBuilder: (
            _,
            int index,
          ) =>
              kitchenlistDataItem(
                  kitchen[index].articleName, kitchen[index].qty),
        ),
      ),
    );

    final vehicles_rows = Container(
      height: 50,
      child: Scrollbar(

        child: ListView.builder(
//        scrollDirection:null,
          itemCount: vehicles.length,
//        shrinkWrap: true,
          itemBuilder: (
            _,
            int index,
          ) =>
              vehicleslistDataItem(
                  vehicles[index].articleName, vehicles[index].qty),
        ),
      ),
    );

    final custom_rows = Container(
      height: 50,
      child: Scrollbar(

        child: ListView.builder(
//        scrollDirection:null,
          itemCount: customs.length,
//        shrinkWrap: true,
          itemBuilder: (
              _,
              int index,
              ) =>
              vehicleslistDataItem(
                  customs[index].articleName, customs[index].qty),
        ),
      ),
    );

    return Column(
      children: <Widget>[
        isbedroom
            ? bedroom_text
            : SizedBox(
                height: 0,
              ),
        isbedroom
            ? bedroom_rows
            : SizedBox(
                height: 0,
              ),
        islivingroom
            ? livingroom_text
            : SizedBox(
                height: 0,
              ),
        islivingroom
            ? livingroom_rows
            : SizedBox(
                height: 0,
              ),
        iskitchen
            ? kitchen_text
            : SizedBox(
                height: 0,
              ),
        iskitchen
            ? kitchen_rows
            : SizedBox(
                height: 0,
              ),
        isvehicle
            ? vehicle_text
            : SizedBox(
                height: 0,
              ),
        isvehicle
            ? vehicles_rows
            : SizedBox(
                height: 0,
              ),

        iscustom
            ? custom_text
            : SizedBox(
          height: 0,
        ),
        iscustom
            ? custom_rows
            : SizedBox(
          height: 0,
        ),
      ],
    );
  }
}

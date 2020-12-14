import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moveto/model/LoadingFloorNoModel.dart';
import 'package:moveto/globals.dart' as globals;


class UnloadingFloorListView extends StatelessWidget {
  // bool isSelected = false;

  List<FloorModel> arlstModel = List<FloorModel>();

  Future<List<FloorModel>> _fetchJobs() async {
    final http.Response response = await http.post(
      'http://skymoonlabs.com/moveto/demo/wp-content/plugins/moveto/api/moveto_api_test.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"action": "get_floors"}),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var status = json.decode(response.body)['status'];
      if (status == "true") {
        var tagObjsJson = jsonDecode(response.body)['response'] as List;
        return arlstModel =
            tagObjsJson.map((tagJson) => FloorModel.fromJson(tagJson)).toList();
      } else {
        return null;
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Container _FloorListView(data) {
    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        border: Border.all(
            color: Colors.white, //                   <--- border color
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
            color: Colors.white, // set border color
            width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(7.0), //                 <--- border radius here
        ),
      );
    }

    return new Container(
      height: 50,
      // color: Colors.redAccent,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        primary: false,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              globals.CountedItem.unloading_floor_price=0;

              // String index;
              (context as Element).markNeedsBuild();
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

              globals.CountedItem.unloading_floor_price =
                  globals.CountedItem.unloading_floor_price +
                      int.parse(data[index].price);
//              print(data[index].price);
              print("unloading_floor_price=" +
                  globals.CountedItem.unloading_floor_price.toString());
            },
            child: AnimatedContainer(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 500),
              decoration: (data[index].id).contains('isclciked')
                  ? myRedBoxDecoration()
                  : myBoxDecoration(),
              width: MediaQuery.of(context).size.width * 0.15,
              child: Card(
                color: (data[index].id).contains('isclciked')
                    ? Colors.white
                    : Colors.redAccent,
                child: Container(
                  child: Center(
                    child: _tile(data[index].floorNo, data[index].id),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Text _tile(String title, String id) => Text(
    title,
    style: TextStyle(
      fontSize: 18,
      color: id.contains('isclciked') ? Colors.redAccent : Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FloorModel>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<FloorModel> data = snapshot.data;
          return _FloorListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 7,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
        );
      },
    );
  }
}

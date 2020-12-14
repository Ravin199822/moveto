import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moveto/model/ModelBean.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';

class ModelListView extends StatelessWidget {
  // bool isSelected = false;

  List<ModelBean> arlstModel = List<ModelBean>();

  Future<List<ModelBean>> _fetchJobs() async {
    final http.Response response = await http.post(
      'http://skymoonlabs.com/moveto/demo/wp-content/plugins/moveto/api/moveto_api_test.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'action': "get_movesize",
      }),
    );
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      if (status == "true") {
        var tagObjsJson = jsonDecode(response.body)['response'] as List;
        return arlstModel =
            tagObjsJson.map((tagJson) => ModelBean.fromJson(tagJson)).toList();
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to load album');
    }
  }

  Container _ModelListView(data) {
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
            },
            child: AnimatedContainer(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 500),
              decoration: (data[index].id).contains('isclciked')
                  ? myRedBoxDecoration()
                  : myBoxDecoration(),
              width: MediaQuery.of(context).size.width * 0.3,
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
    );
  }

  AutoSizeText _tile(String title, String id) => AutoSizeText(
        title,
        style: TextStyle(
          fontSize: 18,
          color: id.contains('isclciked') ? Colors.redAccent : Colors.white,
        ),
        maxLines: 1,
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelBean>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ModelBean> data = snapshot.data;
          return _ModelListView(data);
        } else if (snapshot.hasError) {
          return AutoSizeText("${snapshot.error}");
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

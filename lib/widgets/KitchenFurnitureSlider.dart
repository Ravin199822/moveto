import 'dart:convert';

//https://flutter-examples.com/flutter-enable-disable-raisedbutton/
import 'package:flutter/material.dart';
import 'package:moveto/model/ArticalAllCategoryModelBean.dart';
import 'package:moveto/model/Articles_All_Model.dart';
import 'package:http/http.dart' as http;
import 'package:moveto/globals.dart' as globals;


class KitchenFurnitureListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KitchenFurnitureBodyWidget();
  }
}

class KitchenFurnitureBodyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _KitchenFurnitureBodyWidgetState();
}

class _KitchenFurnitureBodyWidgetState extends State<KitchenFurnitureBodyWidget> {
  var _future;
  bool _isButtonDisabled = false;
  var buttonclick = 'pluse';


  @override
  initState() {
    super.initState();
    _future = _fetchCategory();
  }

  int count = 0;

  List furniture;
  String image =
      'http://skymoonlabs.com/moveto/demo/wp-content/plugins/moveto/assets/images/icons/article-icons/';

  List<ArticleAllModelResponse> arlstModel = List<ArticleAllModelResponse>();
  List<CategoryModelResponse> categorylist = List<CategoryModelResponse>();
  List<ArticleAllModelResponse> arlstselectedfurniture =
  List<ArticleAllModelResponse>();

  Future<List<ArticleAllModelResponse>> mainfurniture;

  Future<List<ArticleAllModelResponse>> _fetchJobs(List furniture) async {
    final http.Response response = await http.post(
      'http://skymoonlabs.com/moveto/demo/wp-content/plugins/moveto/api/moveto_api_test.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'action': "get_all_article",
      }),
    );
    // pri
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      if (status == "true") {
        var tagObjsJson = jsonDecode(response.body)['response'] as List;
        arlstModel = tagObjsJson
            .map((tagJson) => ArticleAllModelResponse.fromJson(tagJson))
            .toList();
        print("furnitur------54 " + '$furniture');
        print('Furni_length' + furniture.length.toString());
        List<ArticleAllModelResponse> arlstselectedfurniture =
        List<ArticleAllModelResponse>();
        for (int i = 0; i < arlstModel.length; i++) {
          for (int j = 0; j < furniture.length; j++) {
            if (furniture[j] == arlstModel[i].id) {
              arlstselectedfurniture.add(arlstModel[i]);
            }
          }
        }
        return arlstselectedfurniture;
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future<List<ArticleAllModelResponse>> _fetchCategory() async {
    final http.Response response = await http.post(
      'http://skymoonlabs.com/moveto/demo/wp-content/plugins/moveto/api/moveto_api_test.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "room_type_id": "3",
        'action': "get_article_category",
      }),
    );

    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      if (status == "true") {
        var tagObjsJson = jsonDecode(response.body)['response'] as List;

        categorylist = tagObjsJson
            .map((tagJson) => CategoryModelResponse.fromJson(tagJson))
            .toList();

        //furniture
        String furniture = categorylist[0].articleId;
        print(furniture);
        List furniturelist = furniture.split(",") as List;
        // pass data as a list
        mainfurniture = _fetchJobs(furniturelist);
        return mainfurniture;
      } else {
        throw Exception('Failed to load album');
      }
    }
  }

  Container _ArticleListView(data) {



    String getNumberofFurnitureItems(String operation, String name) {
      int _furnitureselectedItem = 0;
      if (globals.CountedItem.kitchenfurnitureglobal == null) {
        return '0';
      } else if (operation == 'pluse') {
        _furnitureselectedItem = _furnitureselectedItem;
        for (int i = 0;
        i < globals.CountedItem.kitchenfurnitureglobal.length;
        i++) {
          if (name ==
              globals.CountedItem.kitchenfurnitureglobal[i].articleName) {
            _furnitureselectedItem += 1;
          }
        }
        return _furnitureselectedItem.toString();
      } else if (operation == 'minus') {
        _furnitureselectedItem = _furnitureselectedItem;
        for (int i = 0;
        i < globals.CountedItem.kitchenfurnitureglobal.length;
        i++) {
          if (name ==
              globals.CountedItem.kitchenfurnitureglobal[i].articleName) {
            _furnitureselectedItem = _furnitureselectedItem - 1;
          }
        }
        return _furnitureselectedItem.abs().toString();
      }
    }








    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        color: Colors.white,
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
            color: Colors.white, // set border color
            width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(7.0), //                 <--- border radius here
        ),
      );
    }

    return new Container(
      height: 160,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        primary: false,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
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
              print(data[index].id);
            },
            child: AnimatedContainer(
              curve: Curves.easeIn,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              duration: Duration(milliseconds: 500),
              decoration: ((data[index].id).contains('isclciked'))
                  ? myBoxDecoration()
                  : myRedBoxDecoration(),
              height: 100.0,
              width: 130.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, bottom: .0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: 35,

                          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: RaisedButton(
                            textColor:  (data[index].id).contains('isclciked')
                                ? Colors.redAccent
                                : Colors.white,
                            color:  (data[index].id).contains('isclciked')
                                ? Colors.white
                                : Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color:  (data[index].id).contains('isclciked')
                                    ? Colors.redAccent
                                    : Colors.white,
                              ),
                            ),
                            child: Container(
                              color: (data[index].id).contains('isclciked')
                                  ? Colors.white
                                  : Colors.white,
                              child: Text(
                                (getNumberofFurnitureItems(buttonclick, data[index].articleName)),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    color:
                                    (data[index].id).contains('isclciked')
                                        ? Colors.redAccent
                                        : Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          alignment: Alignment(-1, 0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, left: 0.0),
                    child: Container(
                      padding: EdgeInsets.only(right: 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Image.network(
                              image + data[index].predefinedimage,
                              width: 60.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 0.0, left: 0.0),
                      child: _tile(data[index].articleName, data[index].id)),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 40,
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: RaisedButton(
                            textColor: Colors.redAccent,
                            color: (data[index].id).contains('isclciked')
                                ? Colors.redAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(color: Colors.redAccent),
                            ),
                            child: Text(
                              '+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (data[index].id).contains('isclciked')
                                      ? Colors.white
                                      : Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              buttonclick = 'pluse';
                              setState(() {
                                print(buttonclick);
                                data[index].qty++;
                                globals.CountedItem.kitchenfurnitureglobal
                                    .add(data[index]);
                              });
                            },
                          ),
                          alignment: Alignment(-1, 0),
                        ),
                        Container(
                          height: 30,
                          width: 40,
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: (data[index].id).contains('isclciked')
                                ? Colors.redAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(color: Colors.red),
                            ),
                            child: Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (data[index].id).contains('isclciked')
                                      ? Colors.white
                                      : Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              buttonclick = 'minus';
                              setState(() {
                                data[index].qty--;
                                globals.CountedItem.kitchenfurnitureglobal
                                    .remove(data[index]);
                              });
                            },
                          ),
                          alignment: Alignment(1, 0),
                        )
                      ],
                    ),
                  ),
                ],
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
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: id.contains('isclciked') ? Colors.redAccent : Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleAllModelResponse>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ArticleAllModelResponse> data = snapshot.data;
          return _ArticleListView(data);
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

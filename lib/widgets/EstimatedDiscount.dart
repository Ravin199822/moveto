import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:moveto/globals.dart' as globals;


class EstimatedDiscount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EstimatedDiscountBodyWidget();
  }
}

class EstimatedDiscountBodyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _EstimatedDiscountBodyWidgetState();
}

class _EstimatedDiscountBodyWidgetState
    extends State<EstimatedDiscountBodyWidget> {
  Future<List<dynamic>> _fetchJobs() async {
    final http.Response response = await http.post(
      'http://skymoonlabs.com/moveto/demo/wp-content/plugins/moveto/api/moveto_api_test.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'action': "get_elevator",
      }),
    );
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      if (status == "true") {
        var data = jsonDecode(response.body)['response'] as List;
        globals.CountedItem.discount_percentage=int.parse(data[0]['discount']);
        print(globals.CountedItem.discount_percentage);
        return data;
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to load album');
    }
  }

  Container _ModelPriceView(data) {
    return new Container(
      padding: EdgeInsets.fromLTRB(18, 5, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new Text(
              "Discount",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
          ),
          new Flexible(
            child: new Text(
              globals.CountedItem.discount_percentage.toString()+'\%',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> data = snapshot.data as List<dynamic>;
          return _ModelPriceView(data);
        } else if (snapshot.hasError) {
          return AutoSizeText("${snapshot.error}");
        }
        return CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 5,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
        );
      },
    );
  }
}

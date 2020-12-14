import 'package:flutter/material.dart';

class kitchenlistDataItem extends StatelessWidget {
  String kitchenitem;
  int qty;

  kitchenlistDataItem(this.kitchenitem, this.qty);

  @override
  Widget build(BuildContext context) {
    final kitchen_item = Container(
      padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new Text(
              kitchenitem,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
          ),
          new Flexible(
            child: new Text(
              qty.toString(),
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
    return new Container(
      height: 17,
      child: kitchen_item,
    );
  }
}

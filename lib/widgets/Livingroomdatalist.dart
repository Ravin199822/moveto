import 'package:flutter/material.dart';

class livingroomlistDataItem extends StatelessWidget {
  String livingroomitem;
  int qty;

  livingroomlistDataItem(this.livingroomitem, this.qty);

  @override
  Widget build(BuildContext context) {
    final livingroom_item = Container(
      padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new Text(
              livingroomitem,
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
      child: livingroom_item,
    );
  }
}

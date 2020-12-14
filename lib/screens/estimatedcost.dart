import 'package:flutter/material.dart';
import 'package:moveto/globals.dart' as globals;
import 'package:moveto/widgets/EstimatedDiscount.dart';
import 'package:moveto/widgets/EstimatedPacking.dart';
import 'package:moveto/widgets/EstimatedSelectedItems.dart';
import 'package:moveto/widgets/EstimatedUnPackingPrice.dart';

import 'payment.dart';

class EstimatedCost extends StatefulWidget {
  EstimatedCost({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EstimatedCost createState() => _EstimatedCost();
}

class _EstimatedCost extends State<EstimatedCost> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

//  final nameController = TextEditingController();
//  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TotalvolumeText = Container(
      padding: EdgeInsets.fromLTRB(18, 5, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new Text(
              "Total Volume(Cubic Feet)",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
          ),
          new Flexible(
            child: new Text(
              (globals.CountedItem.totalvolume).toString() + " ft",
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

    final LoadingEstimationText = Container(
      padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
      child: Text(
        "Loading Estimation",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final FloorpriceText = Container(
      padding: EdgeInsets.fromLTRB(18, 5, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new Text(
              "Floor Price",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
          ),
          new Flexible(
            child: new Text(
              "\$" + globals.CountedItem.loading_floor_price.toString(),
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

    final ElevatorpriceText = Container(
      padding: EdgeInsets.fromLTRB(18, 5, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new Text(
              "Elevator Price",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
          ),
          new Flexible(
            child: new Text(
              '\$0',
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

    final UnloadingEstimationText = Container(
      padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
      child: Text(
        "Unloading Estimation",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final UnFloorpriceText = Container(
      padding: EdgeInsets.fromLTRB(18, 5, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new Text(
              "Floor Price",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
          ),
          new Flexible(
            child: new Text(
              "\$" + globals.CountedItem.unloading_floor_price.toString(),
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

    final UnElevatorpriceText = Container(
      padding: EdgeInsets.fromLTRB(18, 5, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new Text(
              "Elevator Price",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
          ),
          new Flexible(
            child: new Text(
              "\$0",
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

    final SubtotalText = Container(
      padding: EdgeInsets.fromLTRB(18, 30, 0, 0),
      child: Text(
        "Subtotal",
        style: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.normal),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final DiscountText = Container(
      padding: EdgeInsets.fromLTRB(18, 3, 0, 0),
      child: Text(
        "Discount",
        style: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.normal),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final GstText = Container(
      padding: EdgeInsets.fromLTRB(18, 3, 0, 0),
      child: Text(
        "GST/TAX",
        style: TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.normal),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final dividerDesign = Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Divider(
        color: Colors.black,
        height: 20,
        thickness: 1,
        indent: 0,
        endIndent: 0,
      ),
    );

    final TotalText = Container(
      padding: EdgeInsets.fromLTRB(18, 5, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Flexible(
            child: new Text(
              "Total",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          new Flexible(
            child: new Text(
              "\$230",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
    final CheckoutButon = Container(
      height: 50,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.redAccent),
        ),
        child: Text(
          'Checkout',
          textAlign: TextAlign.start,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Payment(),
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
        title: Text('Estimated cost',
            style: TextStyle(
                fontFamily: 'Arial', fontSize: 20.0, color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height + 200,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height + 200,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.transparent,
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  child: Container(
                    child: Wrap(
                      children: <Widget>[
                        EstimatedSelectedItems(),
                        TotalvolumeText,
                        LoadingEstimationText,
                        FloorpriceText,
                        ElevatorpriceText,
                        EstimatedPackingPrice(),
                        UnloadingEstimationText,
                        UnFloorpriceText,
                        UnElevatorpriceText,
                        EstimatedUnPackingUnpacking(),
                        SubtotalText,
                        EstimatedDiscount(),
                        GstText,
                        dividerDesign,
                        TotalText,
                        CheckoutButon
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

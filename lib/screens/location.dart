import 'package:flutter/material.dart';
import 'package:moveto/widgets/LocationMapWidget.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocationViewBodyWidget();
  }
}

class LocationViewBodyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationViewBodyWidgetState();
}

class _LocationViewBodyWidgetState extends State<LocationViewBodyWidget> {
  TextStyle style = TextStyle(fontFamily: 'Arial - regular', fontSize: 20.0);

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Location',
            style: TextStyle(
                fontFamily: 'Arial', fontSize: 20.0, color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            LocationMapView(),
          ],
        ),
      ),
    );
  }
}


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:moveto/screens/loadingdetails.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:math' show cos, sqrt, asin;

class LocationMapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocationMapViewBodyWidget();
  }
}

class LocationMapViewBodyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LocationMapViewBodyWidgetState();
}

class LocationMapViewBodyWidgetState extends State<LocationMapViewBodyWidget> {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0, 0));
  GoogleMapController mapController;

  final Geolocator _geolocator = Geolocator();

  Position _currentPosition;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();
  final viaAddressController = TextEditingController();
  String _currentAddress;
  String _startAddress = '';
  String _viaAddress = '';
  String _destinationAddress = '';
  String _placeDistance;
  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  Set<Marker> markers = {};
  BitmapDescriptor icon;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    print("initstate called");
    super.initState();
    _getCurrentLocation();
  }

  Future<Position> _getCurrentLocation() async {
    try {
      _currentPosition = await _geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print("72");
      print(_currentPosition);
    } catch (e) {
      _currentPosition = null;
    }
    return _currentPosition;
  }

  Future<bool> _calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Placemark> startPlacemark =
      await _geolocator.placemarkFromAddress(_startAddress);
      List<Placemark> destinationPlacemark =
      await _geolocator.placemarkFromAddress(_destinationAddress);

      if (startPlacemark != null && destinationPlacemark != null) {
        Position startCoordinates = _startAddress == _currentAddress
            ? Position(
            latitude: _currentPosition.latitude,
            longitude: _currentPosition.longitude)
            : startPlacemark[0].position;
        Position destinationCoordinates = destinationPlacemark[0].position;

        // Start Location Marker
        Marker startMarker = Marker(
          markerId: MarkerId('$startCoordinates'),
          position: LatLng(
            startCoordinates.latitude,
            startCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Start',
            snippet: _startAddress,
          ),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(devicePixelRatio: 28.0),
              "assets/blackloca.png"),
        );

        // Destination Location Marker
        Marker destinationMarker = Marker(
          markerId: MarkerId('$destinationCoordinates'),
          position: LatLng(
            destinationCoordinates.latitude,
            destinationCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Destination',
            snippet: _destinationAddress,
          ),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(devicePixelRatio: 28.0), "assets/redloca.png"),
        );

        // Adding the markers to the list
        markers.add(startMarker);
        markers.add(destinationMarker);

        print('START COORDINATES: $startCoordinates');
        print('DESTINATION COORDINATES: $destinationCoordinates');

        Position _northeastCoordinates;
        Position _southwestCoordinates;

        // Calculating to check that
        // southwest coordinate <= northeast coordinate
        if (startCoordinates.latitude <= destinationCoordinates.latitude) {
          _southwestCoordinates = startCoordinates;
          _northeastCoordinates = destinationCoordinates;
        } else {
          _southwestCoordinates = destinationCoordinates;
          _northeastCoordinates = startCoordinates;
        }

        // Accomodate the two locations within the
        // camera view of the map
        mapController.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              northeast: LatLng(
                _northeastCoordinates.latitude,
                _northeastCoordinates.longitude,
              ),
              southwest: LatLng(
                _southwestCoordinates.latitude,
                _southwestCoordinates.longitude,
              ),
            ),
            100.0,
          ),
        );

        await _createPolylines(startCoordinates, destinationCoordinates);

        double totalDistance = 0.0;

        // Calculating the total distance by adding the distance
        // between small segments
        for (int i = 0; i < polylineCoordinates.length - 1; i++) {
          totalDistance += _coordinateDistance(
            polylineCoordinates[i].latitude,
            polylineCoordinates[i].longitude,
            polylineCoordinates[i + 1].latitude,
            polylineCoordinates[i + 1].longitude,
          );
        }

        setState(() {
          _placeDistance = totalDistance.toStringAsFixed(2);
          print('DISTANCE: $_placeDistance km');
        });

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(Position start, Position destination) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyDIx_jprz_nOTY0XoE8uhbX6oAy16GIyOc', // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.redAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
  }

  Widget _textField({
    TextEditingController controller,
    String label,
    String hint,
    String initialValue,
    double width,
    Icon prefixIcon,
    Widget suffixIcon,
    Function(String) locationCallback,
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        // initialValue: initialValue,
        decoration: new InputDecoration(
          prefixIcon: prefixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.redAccent,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.redAccent,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Mapconatainer = Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        markers: markers != null ? Set<Marker>.from(markers) : null,
        initialCameraPosition: _initialLocation,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.satellite,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        polylines: Set<Polyline>.of(polylines.values),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),
    );

    final locationText = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(
        "Location",
        style: TextStyle(
            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      alignment: Alignment(-1, 0),
    );

    final source_textfield = _textField(
        label: 'Sorce',
        hint: 'Choose starting point',
        initialValue: _currentAddress,
        prefixIcon: Icon(
          Icons.person_pin_circle,
          color: Colors.redAccent,
        ),
        controller: startAddressController,
        width: MediaQuery.of(context).size.width,
        locationCallback: (String value) {
          setState(() {
            _startAddress = value;
          });
        });

    final via_textfield = _textField(
        label: 'Via',
        hint: 'Choose via destination',
        initialValue: '',
        prefixIcon: Icon(
          Icons.add_circle,
          color: Colors.redAccent,
        ),
//        controller: viaAddressController,
        width: MediaQuery.of(context).size.width,
        locationCallback: (String value) {
          setState(() {
//            _viaAddress = value;
          });
        });

    final destination_textfield = _textField(
        label: 'Destination',
        hint: 'Choose destination',
        initialValue: '',
        prefixIcon: Icon(
          Icons.location_on,
          color: Colors.redAccent,
        ),
        controller: destinationAddressController,
        width: MediaQuery.of(context).size.width,
        locationCallback: (String value) {
          setState(() {
            _destinationAddress = value;
          });
        });

    final distance_visible_text = Visibility(
      visible: _placeDistance == null ? false : true,
      child: Text(
        'DISTANCE: $_placeDistance km',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final show_route_button = Container(
      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: RaisedButton(
        onPressed: (_startAddress != '' &&
            _destinationAddress != '' &&
            _viaAddress != '')
            ? () async {
          setState(() {
            if (markers.isNotEmpty) markers.clear();
            if (polylines.isNotEmpty) polylines.clear();
            if (polylineCoordinates.isNotEmpty)
              polylineCoordinates.clear();
            _placeDistance = null;
          });

          _calculateDistance().then((isCalculated) {
            if (isCalculated) {
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text('Distance Calculated Sucessfully'),
                ),
              );
            } else {
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text('Error Calculating Distance'),
                ),
              );
            }
          });
        }
            : (_startAddress != '' && _destinationAddress != '')
            ? () async {
          setState(() {
            if (markers.isNotEmpty) markers.clear();
            if (polylines.isNotEmpty) polylines.clear();
            if (polylineCoordinates.isNotEmpty)
              polylineCoordinates.clear();
            _placeDistance = null;
          });

          _calculateDistance().then((isCalculated) {
            if (isCalculated) {
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text('Distance Calculated Sucessfully'),
                ),
              );
            } else {
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text('Error Calculating Distance'),
                ),
              );
            }
          });
        }
            : null,
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(
            'Show Route',
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );

    final next_button = Container(
      padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
      child: RaisedButton(
        onPressed: () {
          //Use`Navigator` widget to push the second screen to out stack of screens
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new LoadingDetails();
          }));
        },
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(
            '       Next         ',
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );

    final calculate_distance_container = SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 10),
                  source_textfield,
                  SizedBox(height: 10),
                  via_textfield,
                  SizedBox(height: 10),
                  destination_textfield,
                  SizedBox(height: 10),
                  distance_visible_text,
                  SizedBox(height: 5),
                  Row(
                    children: [
                      show_route_button,
                      next_button,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Stack(
          children: <Widget>[
            Mapconatainer,
            locationText,
            calculate_distance_container,
          ],
        ),
      ),
    );
  }
}




















































































//import 'package:auto_size_text/auto_size_text.dart';
//import 'package:flutter/material.dart';
//import 'package:moveto/screens/loadingdetails.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
//import 'dart:math' show cos, sqrt, asin;
//
//class LocationMapView extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return LocationMapViewBodyWidget();
//  }
//}
//
//class LocationMapViewBodyWidget extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => LocationMapViewBodyWidgetState();
//}
//
//class LocationMapViewBodyWidgetState extends State<LocationMapViewBodyWidget> {
//  CameraPosition _initialLocation = CameraPosition(target: LatLng(0, 0));
//  GoogleMapController mapController;
//
//  final Geolocator _geolocator = Geolocator();
//
//  Position _currentPosition;
//
//  final startAddressController = TextEditingController();
//  final destinationAddressController = TextEditingController();
//  final viaAddressController = TextEditingController();
//  String _currentAddress;
//  String _startAddress = '';
//  String _viaAddress = '';
//  String _destinationAddress = '';
//  String _placeDistance;
//  PolylinePoints polylinePoints;
//  Map<PolylineId, Polyline> polylines = {};
//  List<LatLng> polylineCoordinates = [];
//  List<PolylineWayPoint> waypoint = [];
//  Set<Marker> markers = {};
//  BitmapDescriptor icon;
//
//  final _scaffoldKey = GlobalKey<ScaffoldState>();
//
//  Invocation get invocation => null;
//
//  @override
//  void initState() {
//    print("initstate called");
//    super.initState();
//    _getCurrentLocation();
//  }
//
//  Future<Position> _getCurrentLocation() async {
//    try {
//      _currentPosition = await _geolocator.getCurrentPosition(
//          desiredAccuracy: LocationAccuracy.high);
//      print("72");
//      print(_currentPosition);
//    } catch (e) {
//      _currentPosition = null;
//    }
//    return _currentPosition;
//  }
//
//  Future<bool> _calculateDistance() async {
//    try {
//      // Retrieving placemarks from addresses
//      List<Placemark> startPlacemark =
//          await _geolocator.placemarkFromAddress(_startAddress);
//      List<Placemark> destinationPlacemark =
//          await _geolocator.placemarkFromAddress(_destinationAddress);
//      List<Placemark> viaPlacemark =
//          await _geolocator.placemarkFromAddress(_viaAddress);
//
//      if (startPlacemark != null && destinationPlacemark != null) {
////        if (startPlacemark != null && destinationPlacemark != null && viaPlacemark !=null)
//        {
//          Position startCoordinates = _startAddress == _currentAddress
//              ? Position(
//                  latitude: _currentPosition.latitude,
//                  longitude: _currentPosition.longitude)
//              : startPlacemark[0].position;
//          Position destinationCoordinates = destinationPlacemark[0].position;
//          Position viaCoordinates = viaPlacemark[0].position;
//
//          // Start Location Marker
//          Marker startMarker = Marker(
//            markerId: MarkerId('$startCoordinates'),
//            position: LatLng(
//              startCoordinates.latitude,
//              startCoordinates.longitude,
//            ),
//            infoWindow: InfoWindow(
//              title: 'Source',
//              snippet: _startAddress,
//            ),
//            icon: await BitmapDescriptor.fromAssetImage(
//                ImageConfiguration(devicePixelRatio: 28.0),
//                "assets/blackloca.png"),
//          );
//
//          Marker viaMarker = Marker(
//            markerId: MarkerId('$viaCoordinates'),
//            position: LatLng(
//              viaCoordinates.latitude,
//              viaCoordinates.longitude,
//            ),
//            infoWindow: InfoWindow(
//              title: 'Via',
//              snippet: _viaAddress,
//            ),
//            icon: BitmapDescriptor.defaultMarker,
////            icon: await BitmapDescriptor.fromAssetImage(
////                ImageConfiguration(devicePixelRatio: 28.0),
////                "assets/blackloca.png"),
//          );
//
//          // Destination Location Marker
//          Marker destinationMarker = Marker(
//            markerId: MarkerId('$destinationCoordinates'),
//            position: LatLng(
//              destinationCoordinates.latitude,
//              destinationCoordinates.longitude,
//            ),
//            infoWindow: InfoWindow(
//              title: 'Destination',
//              snippet: _destinationAddress,
//            ),
//            icon: await BitmapDescriptor.fromAssetImage(
//                ImageConfiguration(devicePixelRatio: 28.0),
//                "assets/redloca.png"),
//          );
//
//          // Adding the markers to the list
//          markers.add(startMarker);
//          markers.add(viaMarker);
//          markers.add(destinationMarker);
//
//          print('START COORDINATES: $startCoordinates');
//          print('Via CORDINATES: $viaCoordinates');
//          print('DESTINATION COORDINATES: $destinationCoordinates');
////          print(viaCoordinates
////              .toString()
////              .length);
//
//          Position _northeastCoordinates;
//          Position _southwestCoordinates;
//
//          // Calculating to check that
//          // southwest coordinate <= northeast coordinate
//
//          if (startCoordinates.latitude <= destinationCoordinates.latitude) {
//            _southwestCoordinates = startCoordinates;
//            _northeastCoordinates = destinationCoordinates;
//          } else {
//            _southwestCoordinates = destinationCoordinates;
//            _northeastCoordinates = startCoordinates;
//          }
//
//          // Accomodate the two locations within the
//          // camera view of the map
//          mapController.animateCamera(
//            CameraUpdate.newLatLngBounds(
//              LatLngBounds(
//                northeast: LatLng(
//                  _northeastCoordinates.latitude,
//                  _northeastCoordinates.longitude,
//                ),
//                southwest: LatLng(
//                  _southwestCoordinates.latitude,
//                  _southwestCoordinates.longitude,
//                ),
//              ),
//              100.0,
//            ),
//          );
////          if (destinationCoordinates.latitude <= viaCoordinates.latitude) {
////            _southwestCoordinates = destinationCoordinates;
////            _northeastCoordinates = viaCoordinates;
////          } else {
////            _southwestCoordinates = viaCoordinates;
////            _northeastCoordinates = destinationCoordinates;
////          }
//
//          await _createPolylines(
//              startCoordinates, destinationCoordinates, viaCoordinates);
//
//          double totalDistance = 0.0;
//
//          // Calculating the total distance by adding the distance
//          // between small segments
//          for (int i = 0; i < polylineCoordinates.length - 1; i++) {
//            totalDistance += _coordinateDistance(
//              polylineCoordinates[i].latitude,
//              polylineCoordinates[i].longitude,
//              polylineCoordinates[i + 1].latitude,
//              polylineCoordinates[i + 1].longitude,
//            );
//          }
//
//          setState(() {
//            _placeDistance = totalDistance.toStringAsFixed(2);
//            print('DISTANCE: $_placeDistance km');
//          });
//
//          return true;
//        }
//      }
//    } catch (e) {
//      print(e);
//    }
//    return false;
//  }
//
//  // Formula for calculating distance between two coordinates
//  // https://stackoverflow.com/a/54138876/11910277
//  double _coordinateDistance(lat1, lon1, lat2, lon2) {
//    var p = 0.017453292519943295;
//    var c = cos;
//    var a = 0.5 -
//        c((lat2 - lat1) * p) / 2 +
//        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
//    return 12742 * asin(sqrt(a));
//  }
//
//  // Create the polylines for showing the route between two places
//  _createPolylines(Position start, Position destination, Position via) async {
//    polylinePoints = PolylinePoints();
//    print("231");
//    if (via.toString() != null) {
//      waypoint.add(PolylineWayPoint(location: _viaAddress));
//      print(waypoint.length);
//      for (int i = 0; i < waypoint.length; i++) {
//        print(waypoint[i]);
//      }
//    }
//    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//      'AIzaSyDIx_jprz_nOTY0XoE8uhbX6oAy16GIyOc', // Google Maps API Key
//      PointLatLng(start.latitude, start.longitude),
//      PointLatLng(destination.latitude, destination.longitude),
//      wayPoints: waypoint.iterator.current.noSuchMethod(invocation),
//      travelMode: TravelMode.driving,
////      optimizeWaypoints: true,
////      wayPoints: waypoint,
//    );
//
//    if (result.points.isNotEmpty) {
//      result.points.add(PointLatLng(via.latitude, via.longitude));
//      result.points.forEach((PointLatLng point) {
////        print(point);
//        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//      });
//    }
////    print(polylineCoordinates);
//
//    PolylineId id = PolylineId('poly');
//    Polyline polyline = Polyline(
//      polylineId: id,
//      color: Colors.redAccent,
//      points: polylineCoordinates,
//      width: 8,
//    );
//    polylines[id] = polyline;
//    setState(() {});
//  }
//
//  Widget _textField({
//    TextEditingController controller,
//    String label,
//    String hint,
//    String initialValue,
//    double width,
//    Icon prefixIcon,
//    Widget suffixIcon,
//    Function(String) locationCallback,
//  }) {
//    return Container(
//      width: width * 0.8,
//      child: TextField(
//        onChanged: (value) {
//          locationCallback(value);
//        },
//        controller: controller,
//        // initialValue: initialValue,
//        decoration: new InputDecoration(
//          prefixIcon: prefixIcon,
//          labelText: label,
//          filled: true,
//          fillColor: Colors.white,
//          enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.all(
//              Radius.circular(10.0),
//            ),
//            borderSide: BorderSide(
//              color: Colors.redAccent,
//              width: 2,
//            ),
//          ),
//          focusedBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.all(
//              Radius.circular(10.0),
//            ),
//            borderSide: BorderSide(
//              color: Colors.redAccent,
//              width: 2,
//            ),
//          ),
//          contentPadding: EdgeInsets.all(15),
//          hintText: hint,
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final Mapconatainer = Container(
//      height: 270,
//      width: MediaQuery.of(context).size.width,
//      child: GoogleMap(
//        markers: markers != null ? Set<Marker>.from(markers) : null,
//        initialCameraPosition: _initialLocation,
//        myLocationEnabled: true,
//        myLocationButtonEnabled: false,
//        mapType: MapType.satellite,
//        zoomGesturesEnabled: true,
//        zoomControlsEnabled: false,
//        polylines: Set<Polyline>.of(polylines.values),
//        onMapCreated: (GoogleMapController controller) {
//          mapController = controller;
//        },
//      ),
//    );
//
//    final locationText = Container(
//      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//      child: Text(
//        "Location",
//        style: TextStyle(
//            fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
//        textAlign: TextAlign.left,
//      ),
//      alignment: Alignment(-1, 0),
//    );
//
//    final source_textfield = _textField(
//        label: 'Sorce',
//        hint: 'Choose starting point',
//        initialValue: _currentAddress,
//        prefixIcon: Icon(
//          Icons.person_pin_circle,
//          color: Colors.redAccent,
//        ),
//        controller: startAddressController,
//        width: MediaQuery.of(context).size.width,
//        locationCallback: (String value) {
//          setState(() {
//            _startAddress = value;
//          });
//        });
//
//    final via_textfield = _textField(
//        label: 'Via',
//        hint: 'Choose via destination',
//        initialValue: '',
//        prefixIcon: Icon(
//          Icons.add_circle,
//          color: Colors.redAccent,
//        ),
//        controller: viaAddressController,
//        width: MediaQuery.of(context).size.width,
//        locationCallback: (String value) {
//          setState(() {
//            _viaAddress = value;
//          });
//        });
//
//    final destination_textfield = _textField(
//        label: 'Destination',
//        hint: 'Choose destination',
//        initialValue: '',
//        prefixIcon: Icon(
//          Icons.location_on,
//          color: Colors.redAccent,
//        ),
//        controller: destinationAddressController,
//        width: MediaQuery.of(context).size.width,
//        locationCallback: (String value) {
//          setState(() {
//            _destinationAddress = value;
//          });
//        });
//
//    final distance_visible_text = Visibility(
//      visible: _placeDistance == null ? false : true,
//      child: Text(
//        'DISTANCE: $_placeDistance km',
//        style: TextStyle(
//          fontSize: 16,
//          fontWeight: FontWeight.bold,
//        ),
//      ),
//    );
//
//    final show_route_button = Container(
//      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
//      child: RaisedButton(
//        onPressed: (_startAddress != '' && _destinationAddress != '')
//            ? () async {
//                setState(() {
//                  if (markers.isNotEmpty) markers.clear();
//                  if (polylines.isNotEmpty) polylines.clear();
//                  if (polylineCoordinates.isNotEmpty)
//                    polylineCoordinates.clear();
//                  _placeDistance = null;
//                });
//
//                _calculateDistance().then((isCalculated) {
//                  if (isCalculated) {
//                    _scaffoldKey.currentState.showSnackBar(
//                      SnackBar(
//                        content: Text('Distance Calculated Sucessfully'),
//                      ),
//                    );
//                  } else {
//                    _scaffoldKey.currentState.showSnackBar(
//                      SnackBar(
//                        content: Text('Error Calculating Distance'),
//                      ),
//                    );
//                  }
//                });
//              }
//            : null,
//        color: Colors.redAccent,
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(20.0),
//        ),
//        child: Container(
//          padding: const EdgeInsets.all(8.0),
//          child: AutoSizeText(
//            'Show Route',
//            maxLines: 1,
//            style: TextStyle(
//              color: Colors.white,
//              fontSize: 15.0,
//            ),
//          ),
//        ),
//      ),
//    );
//
//    final next_button = Container(
//      padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
//      child: RaisedButton(
//        onPressed: () {
//          //Use`Navigator` widget to push the second screen to out stack of screens
//          Navigator.of(context)
//              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
//            return new LoadingDetails();
//          }));
//        },
//        color: Colors.redAccent,
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(20.0),
//        ),
//        child: Container(
//          padding: const EdgeInsets.all(8.0),
//          child: AutoSizeText(
//            '       Next         ',
//            maxLines: 1,
//            style: TextStyle(
//              color: Colors.white,
//              fontSize: 15.0,
//            ),
//          ),
//        ),
//      ),
//    );
//
//    final calculate_distance_container = SafeArea(
//      child: Align(
//        alignment: Alignment.bottomCenter,
//        child: Padding(
//          padding: const EdgeInsets.only(top: 10.0),
//          child: Container(
//            decoration: BoxDecoration(
//              color: Colors.white70,
//              borderRadius: BorderRadius.all(
//                Radius.circular(20.0),
//              ),
//            ),
//            width: MediaQuery.of(context).size.width * 0.9,
//            child: Padding(
//              padding: const EdgeInsets.only(top: 0.0, bottom: 10.0),
//              child: Column(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  SizedBox(height: 10),
//                  source_textfield,
//                  SizedBox(height: 10),
//                  via_textfield,
//                  SizedBox(height: 10),
//                  destination_textfield,
//                  SizedBox(height: 10),
//                  distance_visible_text,
//                  SizedBox(height: 5),
//                  Row(
//                    children: [
//                      show_route_button,
//                      next_button,
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//    return Scaffold(
//      key: _scaffoldKey,
//      body: Container(
//        child: Stack(
//          children: <Widget>[
//            Mapconatainer,
//            locationText,
//            calculate_distance_container,
//          ],
//        ),
//      ),
//    );
//  }
//}

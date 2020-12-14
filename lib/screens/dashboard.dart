import 'package:flutter/material.dart';
import 'package:moveto/screens/articles.dart';
import 'package:moveto/screens/changePassword.dart';
import 'package:moveto/screens/login.dart';
import 'package:moveto/screens/mybookings.dart';

import 'transaction.dart';
import 'updateprofile.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  bool shownewbooking = true;
  bool showmybooking = false;
  bool showtransaction = false;
  bool showsettings = false;

  @override
  Widget build(BuildContext context) {
    final newBooking = Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      width: 160.0,
      height: 160.0,
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: shownewbooking ? Colors.redAccent : Colors.white,
              width: 1,
            ),
          ),
          child: new InkWell(
            onTap: () {
              setState(() {
                shownewbooking = true;
                showmybooking = false;
                showtransaction = false;
                showsettings = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Articles()),
                );
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: shownewbooking ? Colors.white : Colors.redAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0))),
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                      child: Image.asset(
                        'assets/success.png',
                        width: 15.0,
                      ),
                      alignment: Alignment(1, 1),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: shownewbooking
                          ? Image.asset(
                              'assets/red_newbooking.png',
                              width: 64.0,
                            )
                          : Image.asset(
                              'assets/white_newbooking.png',
                              width: 64.0,
                            ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        "New Booking",
                        style: TextStyle(
                            color: shownewbooking
                                ? Colors.redAccent
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final myBooking = Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      width: 160.0,
      height: 160.0,
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: showmybooking ? Colors.redAccent : Colors.white,
              width: 1,
            ),
          ),
          child: new InkWell(
            onTap: () {
              setState(() {
                shownewbooking = false;
                showmybooking = true;
                showtransaction = false;
                showsettings = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mybookings()),
                );
              });
            },
            child: Container(
              // color: Colors.redAccent,
              decoration: BoxDecoration(
                  color: showmybooking ? Colors.white : Colors.redAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0))),
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                      child: Image.asset(
                        'assets/success.png',
                        width: 15.0,
                      ),
                      alignment: Alignment(1, 1),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: showmybooking
                          ? Image.asset(
                              'assets/red_mybooking.png',
                              width: 64.0,
                            )
                          : Image.asset(
                              'assets/white_mybooking.png',
                              width: 64.0,
                            ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "My Booking",
                        style: TextStyle(
                            color:
                                showmybooking ? Colors.redAccent : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final transaction = Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      width: 160.0,
      height: 160.0,
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: showtransaction ? Colors.redAccent : Colors.white,
              width: 1,
            ),
          ),
          child: new InkWell(
            onTap: () {
              setState(() {
                shownewbooking = false;
                showmybooking = false;
                showtransaction = true;
                showsettings = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionPage()),
                );
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: showtransaction ? Colors.white : Colors.redAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0))),
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                      child: Image.asset(
                        'assets/success.png',
                        width: 15.0,
                      ),
                      alignment: Alignment(1, 1),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                      child: showtransaction
                          ? Image.asset(
                              'assets/red_transaction.png',
                              width: 64.0,
                            )
                          : Image.asset(
                              'assets/white_transaction.png',
                              width: 64.0,
                            ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Text(
                        "Transaction",
                        style: TextStyle(
                            color: showtransaction
                                ? Colors.redAccent
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final settings = Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      width: 160.0,
      height: 160.0,
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: showsettings ? Colors.redAccent : Colors.white,
              width: 1,
            ),
          ),
          child: new InkWell(
            onTap: () {
              setState(() {
                shownewbooking = false;
                showmybooking = false;
                showtransaction = false;
                showsettings = true;
                _scaffoldKey.currentState.openDrawer();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: showsettings ? Colors.white : Colors.redAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0))),
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                      child: Image.asset(
                        'assets/success.png',
                        width: 15.0,
                      ),
                      alignment: Alignment(1, 1),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: showsettings
                          ? Image.asset(
                              'assets/red_settings.png',
                              width: 64.0,
                            )
                          : Image.asset(
                              'assets/white_settings.png',
                              width: 64.0,
                            ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                            color:
                                showsettings ? Colors.redAccent : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final upperDrawerback = Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: IconButton(
          icon: Icon(
            Icons.list,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );

    final upperDrawerlogouttext = Container(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: FlatButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
          child: Text(
            'LogOut',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );

    final drawerupperLogout = Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(120),
            bottomLeft: Radius.circular(120),
            topRight: Radius.circular(0),
          ),
          color: Colors.redAccent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          upperDrawerback,
          SizedBox(
            width: 100,
          ),
          upperDrawerlogouttext,
        ],
      ),
    );

    final drawerUserimage = Positioned(
      child: Padding(
        padding: const EdgeInsets.only(top: 110),
        child: Center(
          child: Container(
            height: 70,
            width: 70,
            // color: Colors.redAccent
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Container(
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/user.png'), fit: BoxFit.fill),
              ),
            ),
          ),
        ),
      ),
    );

    final drawerNewbooking = Container(
      height: 30,
      child: new ListTile(
        title: new Text(
          'New Booking',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 15,
          ),
        ),
        leading: new Image(
          image: AssetImage('assets/red_newbooking.png'),
          height: 25,
          width: 25,
          color: Colors.redAccent,
        ),
      ),
    );

    final drawerMybooking = Container(
      height: 30,
      child: new ListTile(
        title: new Text('My Booking'),
        leading: new Image(
          image: AssetImage('assets/red_newbooking.png'),
          height: 25,
          width: 25,
          color: Colors.redAccent,
        ),
      ),
    );

    final drawerUpdateprofile = Container(
      height: 30,
      child: new ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Usersettings()));
        },
        title: new Text('Update Profile'),
        leading: new Icon(
          Icons.account_circle,
          size: 25,
          color: Colors.redAccent,
        ),
      ),
    );

    final drawerChangepassword = Container(
      height: 30,
      child: new ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChangePassword()));
        },
        title: new Text('Change Password'),
        leading: new Icon(
          Icons.lock,
          size: 25,
          color: Colors.redAccent,
        ),
      ),
    );

    final upperDrawer = Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            drawerupperLogout,
          ],
        ),
        drawerUserimage,
      ],
    );

    final lowerDrawer = Container(
      height: 180,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 0),
      padding: EdgeInsets.only(bottom: 20),
      decoration: new BoxDecoration(
        boxShadow: [
          //background color of box
          BoxShadow(
            color: Colors.grey.withOpacity(0.10),
            blurRadius: 0.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              0.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          drawerNewbooking,
          SizedBox(
            height: 10,
          ),
          drawerMybooking,
          SizedBox(
            height: 10,
          ),
          drawerUpdateprofile,
          SizedBox(
            height: 10,
          ),
          drawerChangepassword,
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.redAccent,
      key: _scaffoldKey,
      appBar: AppBar(
        // leading: IconButton(icon: Icon(Icons.menu),color: Colors.white, onPressed: null),

        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Dashboard',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.white)),
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            upperDrawer,
            SizedBox(
              height: 50,
            ),
            lowerDrawer,
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color: Colors.transparent,
              padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Center(
                  child: Wrap(
                    children: <Widget>[
                      newBooking,
                      myBooking,
                      transaction,
                      settings,
                      SizedBox(
                        height: 300,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

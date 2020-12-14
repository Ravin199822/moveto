import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final OldPassController = TextEditingController();
  final NewPassController = TextEditingController();
  final ConfirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        // leading: IconButton(icon: Icon(Icons.menu),color: Colors.white, onPressed: null),

        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Change Password',
            style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 80,
            width: MediaQuery.of(context).size.width,
            //color: Colors.transparent,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: TextField(
                                cursorColor: Colors.redAccent,
                                controller: OldPassController,
                                decoration: InputDecoration(
                                  /*prefixIcon: Icon(
                                          Icons.phone,
                                          color: Colors.redAccent,
                                        ),*/
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 20.0, right: 10.0),
                                  labelText: ' Old Password ',
                                  labelStyle: new TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: TextField(
                                cursorColor: Colors.redAccent,
                                controller: NewPassController,
                                decoration: InputDecoration(
                                  /*prefixIcon: Icon(
                                          Icons.phone,
                                          color: Colors.redAccent,
                                        ),*/
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 20.0, right: 10.0),
                                  labelText: ' New Password ',
                                  labelStyle: new TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: TextField(
                                cursorColor: Colors.redAccent,
                                controller: ConfirmPassController,
                                decoration: InputDecoration(
                                  /* prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.redAccent,
                                        ),*/
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide:
                                        BorderSide(color: Colors.redAccent),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 20.0, right: 10.0),
                                  labelText: ' Confirm Password ',
                                  labelStyle: new TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.white70),
                      ),
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      child: Text(
                        ' Change Password ',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        print(OldPassController.text);
                        print(NewPassController.text);
                        print(ConfirmPassController.text);

                        /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));*/
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

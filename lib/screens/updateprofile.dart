import 'package:flutter/material.dart';

class Usersettings extends StatefulWidget {
  @override
  _UsersettingsState createState() => _UsersettingsState();
}

class _UsersettingsState extends State<Usersettings> {
  //File _image;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  FocusNode _focusNode = new FocusNode();

  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   /* setState(() {
  //     _image = image;
  //   });*/
  // }

  @override
  void initState() {
    super.initState();
    //Add Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
  }

  @override
  void dispose() {
    //Dispose Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
    super.dispose();
  }

  void _onLoginUserNameFocusChange() {
    //Force updated once if focus changed
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        // leading: IconButton(icon: Icon(Icons.menu),color: Colors.white, onPressed: null),

        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Update Profile',
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 80,
                    width: 80,
                    // color: Colors.redAccent,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.grey[350],
                          offset: Offset(6, 6),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ], shape: BoxShape.circle, color: Colors.white),
                    child: Container(
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/user.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Update Profile Image',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
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
                                controller: nameController,
                                decoration: InputDecoration(
                                  alignLabelWithHint: false,
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
                                      EdgeInsets.only(left: 20, right: 150),
                                  labelText: 'Name',
                                  labelStyle: new TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: TextField(
                                cursorColor: Colors.redAccent,
                                controller: phoneController,
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
                                  labelText: 'Mobile Number',
                                  labelStyle: new TextStyle(
                                      color: Colors.redAccent, fontSize: 13),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: TextField(
                                cursorColor: Colors.redAccent,
                                controller: emailController,
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
                                  labelText: ' Email Address ',
                                  labelStyle: new TextStyle(
                                      color: Colors.redAccent, fontSize: 13),
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
                    width: 150,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.white70),
                      ),
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      child: Text(
                        'UPDATE',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        print(nameController.text);
                        print(phoneController.text);
                        print(emailController.text);

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

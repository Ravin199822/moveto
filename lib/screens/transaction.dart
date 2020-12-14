import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        // leading: IconButton(icon: Icon(Icons.menu),color: Colors.white, onPressed: null),

        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: Text('Transactions',
            style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 80,
                width: MediaQuery.of(context).size.width,
                //color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),

                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(bottom:5,top: 10),
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 10, right: 10, ),
                                decoration: BoxDecoration(
                                  
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        offset: Offset(0, 3),
                                        blurRadius: 7.0,
                                        spreadRadius: 3.0)
                                  ],
                                  color: Colors.white,
                                ),
                                height: 140,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 16,top:16 ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Customer Name',
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                'John',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Date',
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                'August 12,2020',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Amount',
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                "348",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Mode',
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                'Credit Card',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
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

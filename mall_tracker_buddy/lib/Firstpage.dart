import 'package:flutter/material.dart';
import 'package:mall_tracker_buddy/admin_panel.dart';
import 'package:mall_tracker_buddy/indoor_navigation.dart';
import 'package:mall_tracker_buddy/signup.dart';
class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                Colors.lightBlue[800],
                Colors.lightBlue[500],
                Colors.lightBlue[200]
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 100, 0, 0),
                  child: Text(
                    "Mall Tracker Buddy",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: InkWell(
                                child: Text("Admin", style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Avenir',
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500),),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => admin_panel()));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: InkWell(
                                child: Text("User", style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Avenir',
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500),),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => sign()));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}

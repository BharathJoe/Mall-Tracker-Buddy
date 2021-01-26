import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mall_tracker_buddy/Add_New_Deals.dart';
import 'package:mall_tracker_buddy/Homepage.dart';
import 'package:mall_tracker_buddy/Retrive_Deals_of_the_day.dart';
import 'package:mall_tracker_buddy/addstoredetails.dart';
import 'package:mall_tracker_buddy/chatbot.dart';
import 'package:mall_tracker_buddy/indoor_navigation.dart';
import 'package:mall_tracker_buddy/retrive_store_detail.dart';
import 'package:mall_tracker_buddy/signup.dart';
import 'package:mall_tracker_buddy/store_details.dart';

class user_panel extends StatefulWidget {
  @override
  _user_panelState createState() => _user_panelState();
}

class _user_panelState extends State<user_panel> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("User Panel"),),
      body: Container(
        alignment: Alignment.center,
        width:380,
        height: 680,
        padding: EdgeInsets.fromLTRB(0,50,0,0),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),

        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text("View store"),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>retrive_store()));
                }
            ),

            RaisedButton(
            child: Text("View Deals"),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>retrive_newdeals()));
            }
            ),
            RaisedButton(
                child: Text(" Mall Map "),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>indoornav()));
                }
            ),
            RaisedButton(
                child: Text("Help Desk"),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Homepage()));
                }
            ),
          ],

        ),
      ),

    );

  }
}
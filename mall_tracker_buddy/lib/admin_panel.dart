import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mall_tracker_buddy/Add_New_Deals.dart';
import 'package:mall_tracker_buddy/addstoredetails.dart';
import 'package:mall_tracker_buddy/chatbot.dart';
import 'package:mall_tracker_buddy/retrive_store_detail.dart';
import 'package:mall_tracker_buddy/signup.dart';

class admin_panel extends StatefulWidget {
  @override
  _admin_panelState createState() => _admin_panelState();
}

class _admin_panelState extends State<admin_panel> {
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(title: Text("Admin Panel"),),
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
                  child: Text("Add New Shop"),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>addstoredetail()));
                  }
              ),

           /*RaisedButton(
            child: Text("Customer Details"),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>addstoredetail()));
            }
            ),*/
              RaisedButton(
                  child: Text("Add Deals of the Day"),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>productupload()));
                  }
              ),
        ],

      ),
          ),

        );

  }
}
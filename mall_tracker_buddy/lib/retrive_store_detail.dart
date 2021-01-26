import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class storedetailretrive extends StatefulWidget {
  @override
  _storedetailretriveState createState() => _storedetailretriveState();
}

class _storedetailretriveState extends State<storedetailretrive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                Colors.orange[900],
                Colors.orange[800],
                Colors.orange[400]
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(90, 100, 0, 0),
                  child: Text(
                    "Store Details",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                    child:store_details(),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

class store_details extends StatefulWidget {
  @override
  _store_detailsState createState() => _store_detailsState();
}

class _store_detailsState extends State<store_details> {
  Query dbRef;
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.reference().child("ShopDetails");
  }
  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      shrinkWrap: true,
      query: dbRef,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index) {
        Map shop = snapshot.value;

        return Container(
          height: 150,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.yellow,
          ),
          child:
          ListTile(title: new Text(shop['ShopName']),
            subtitle: new Text(shop['Category']),
          ),


        );
      },
    );
  }
}

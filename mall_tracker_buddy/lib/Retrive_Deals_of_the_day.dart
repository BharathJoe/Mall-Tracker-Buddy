import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class retrive_newdeals extends StatefulWidget {
  final String prduct,scity;

  const retrive_newdeals({Key key, this.prduct, this.scity}) : super(key: key);

  @override
  _retrive_newdealsState createState() => _retrive_newdealsState();
}

class _retrive_newdealsState extends State<retrive_newdeals> {

  String categorySelectedindex;
  int selectedIndex = 0;

  get dropdownvalue => widget.scity;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),

      body: Container(
        color: Colors.greenAccent,
        child: Column(
          children: [

            buildProduct()
          ],
        ),


      ),


      //Navigator.push(context,MaterialPageRoute(builder: (context) => productlist(city:city[index])));
    );
  }

  Widget buildProduct(){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:20),

        child: FirebaseAnimatedList(

            shrinkWrap: true,
            query:  FirebaseDatabase.instance.reference().child("ProductDetails").reference(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index
                ) {
              Map dis = snapshot.value;

              return Container(

                  child: Card(

                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 4,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 5,
                          child: Image.network('${dis['image']}'),
                        ),

                        Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
                              child: Text(
                                dis['ShopName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),

                              child: Text(dis['ProductDescription'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
              );







            }


        ),


      ),
    );

  }

}



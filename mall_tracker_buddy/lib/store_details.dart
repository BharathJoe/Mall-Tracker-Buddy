import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class retrive_store extends StatefulWidget {
    @override
  _retrive_storeState createState() => _retrive_storeState();
}

class _retrive_storeState extends State<retrive_store> {

  String categorySelectedindex;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


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
            query:  FirebaseDatabase.instance.reference().child("ShopDetails").reference(),
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

                            child: Text(dis['Description'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),

                            child: Text(dis['Category'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),

                            child: Text(dis['Floor'],
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



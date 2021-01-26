import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mall_tracker_buddy/shopdetscreencat.dart';
//import 'DetailsScreen.dart';
import 'themes.dart';

class ret_cat extends StatefulWidget {


  @override
  _ret_catState createState() => _ret_catState();
}

class _ret_catState extends State<ret_cat> {
  String dropdownValue = 'Clothing';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: dropdownValue,
          items: <DropdownMenuItem<String>>[
            DropdownMenuItem(child: Text("Fashion"), value: "Fashion",),
            DropdownMenuItem(child: Text("Clothing"), value: "Clothing",),
            DropdownMenuItem(child: Text("Electronics"), value: "Electronics",),
            DropdownMenuItem(child: Text("Cafeteria"), value: "Cafeteria",),
            DropdownMenuItem(child: Text("Accessories"), value: "Accessories",),
            DropdownMenuItem(child: Text("Kids world"), value: "kids world",),

          ],
          onChanged: (String value) {
            setState(() {
             dropdownValue=value;
            });

          },


        ),

      ),

      body: Container(
        color: Colors.greenAccent[100],
        child: Column(
          children: [


            buildProduct(),



          ],
        ),


      ),



    );
  }

  Widget buildProduct(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),

        child: FirebaseAnimatedList(

            shrinkWrap: true,
            query:  FirebaseDatabase.instance.reference().child("ShopDetails").reference().orderByChild('Category').equalTo('${dropdownValue}'),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index
                ) {
              Map dis = snapshot.value;

              return Container(

                child: GestureDetector(


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
                                  fontSize: 18,),
                              ),
                            ),



                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),

                              child: Text(dis['Floor'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),

                              child: Text(dis['Description'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,color: Colors.black),
                              ),
                            ),

                          ],
                        ),


                      ],
                    ),
                  ),


                ),

              );


              /*  */


            }


        ),


      ),
    );

  }

}




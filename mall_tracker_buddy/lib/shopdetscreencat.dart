import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'DetailsScreen.dart';
import 'themes.dart';
class proret extends StatefulWidget {
  final String dropdownValue;

  const proret({Key key, this.dropdownValue}) : super(key: key);
  @override
  _proretState createState() => _proretState();
}

class _proretState extends State<proret> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(

          body: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),

              child: FirebaseAnimatedList(

                  shrinkWrap: true,
                  query: FirebaseDatabase.instance.reference().child(
                      "ShopDetails").reference()
                      .orderByChild('Category')
                      .equalTo('${widget.dropdownValue}'),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
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
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),

                                    child: Text(dis['Description'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14, color: Colors.black),
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
          ),
        )

    );
  }
}
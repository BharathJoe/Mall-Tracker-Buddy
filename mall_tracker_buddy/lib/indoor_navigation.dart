import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class indoornav extends StatefulWidget {
  @override
  _indoornavState createState() => _indoornavState();
}

class _indoornavState extends State<indoornav> {
  String fromdrop="Map1",todrop="Map1";
  final from = ["Map1", "Map2", "Map3", "Map4"];
  final to = ["Map1", "Map2", "Map3", "Map4"];
  File image= File("assets/mallbuddy.jpg");


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: Text("Mall Tracker"),),
        body:SafeArea(
          child: Container (
            color: Colors.greenAccent,
            alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top:20),
              ),
              Text("From",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              Padding(
                padding: EdgeInsets.only(top:30),
              ),
              DropdownButtonFormField(value:fromdrop,icon:Icon(Icons.arrow_downward),items: from.map((String value){
                return new DropdownMenuItem<String>(value: value,
                    child: Text(value),
                );
              }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      fromdrop = newValue;
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(top:20),
              ),
              Text("To", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              Padding(
                padding: EdgeInsets.only(top:30),
              ),
              DropdownButtonFormField(value:todrop,icon:Icon(Icons.arrow_downward),items: to.map((String value){
                return new DropdownMenuItem<String>(value: value,
                  child: Text(value),
                );
              }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      todrop = newValue;
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(top:30),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text(' View Route'),
                      onPressed: ()
                      {
                        if(fromdrop=="Map1"&& todrop=="Map2")
                          {
                            setState(() {
                              image=File("assets/mall buddy1.jpg");
                            });
                          }
                       else if(fromdrop=="Map1"&& todrop=="Map3")
                        {
                          setState(() {
                            image=File("assets/mall buddy2.jpg");
                          });
                        }
                       else if(fromdrop=="Map1"&& todrop=="Map4")
                        {
                          setState(() {
                            image=File("assets/mall buddy3.jpg");
                          });
                        }
                       else if(fromdrop=="Map2"&& todrop=="Map1")
                        {
                          setState(() {
                            image=File("assets/mall buddy10.jpg");
                          });
                        }
                        else if(fromdrop=="Map2"&& todrop=="Map3")
                        {
                          setState(() {
                            image=File("assets/mall buddy11.jpg");
                          });
                        }
                        else if(fromdrop=="Map2"&& todrop=="Map4")
                        {
                          setState(() {
                            image=File("assets/mall buddy12.jpg");
                          });
                        }
                        else if(fromdrop=="Map3"&& todrop=="Map1")
                        {
                          setState(() {
                            image=File("assets/mall buddy9.jpg");
                          });
                        }
                        else if(fromdrop=="Map3"&& todrop=="Map2")
                        {
                          setState(() {
                            image=File("assets/mall buddy8.jpg");
                          });
                        }
                        else if(fromdrop=="Map3"&& todrop=="Map4")
                        {
                          setState(() {
                            image=File("assets/mall buddy7.jpg");
                          });
                        }
                        else if(fromdrop=="Map4"&& todrop=="Map1")
                        {
                          setState(() {
                            image=File("assets/mall buddy4.jpg");
                          });
                        }
                        else if(fromdrop=="Map4"&& todrop=="Map2")
                        {
                          setState(() {
                            image=File("assets/mall buddy6.jpg");
                          });
                        }
                        else if(fromdrop=="Map4"&& todrop=="Map3")
                        {
                          setState(() {
                            image=File("assets/mall buddy5.jpg");
                          });
                        }
                      },
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Image.asset(image.path,height: 350,width: 1080,),


                  ],
                ),
              ),

],
          ),
          ),
        ),

      ),
    );
  }


}

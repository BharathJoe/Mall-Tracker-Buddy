import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:http/http.dart';
class addstoredetail extends StatefulWidget {
  @override
  _addstoredetailState createState() => _addstoredetailState();
}

class _addstoredetailState extends State<addstoredetail> {
  @override
  Widget build(BuildContext context) {


      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [
                      Colors.greenAccent,
                      Colors.greenAccent,
                      Colors.greenAccent
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: SizedBox(
                  height: 200,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(70, 100, 0, 0),
                    child: Text(
                      "Add Store Details",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          223, 202, 232, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                      BorderSide(color: Colors.purple[100]),
                                    ),
                                  ),
                                  child: store_details(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
  final _formKey = GlobalKey<FormState>();
  String dropdownValue;
  String floorvalue;
  final category = ["Fashion","Clothing","Cafeteria","Kids World","Cosmetic","Fancy Store","Electronics"];
  final snameController = TextEditingController();
  final floor = ["Ground Floor","First Floor","Basement"];
  final DescriptionController = TextEditingController();
  final CategoryController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference().child("ShopDetails");
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: snameController,
              decoration: InputDecoration(
                labelText: "Shop Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Shop Name';
                }

                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200])),
            ),
            child: DropdownButtonFormField(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                decoration: InputDecoration(
                  labelText: "Select Category",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: category.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                }),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200])),
            ),
            child: DropdownButtonFormField(
                value: floorvalue,
                icon: Icon(Icons.arrow_downward),
                decoration: InputDecoration(
                  labelText: "Select Floor",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: floor.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    floorvalue = newValue;
                  });
                }),
          ),


          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: DescriptionController,
              decoration: InputDecoration(
                labelText: "Enter Description",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Description';
                }

                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          RaisedButton(
            child: Text("Post Now"),
            color: Colors.greenAccent,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                dbRef.push().set({
                  "Category": dropdownValue,
                  "ShopName": snameController.text,
                  "Floor": floorvalue,
                  "Description":DescriptionController.text,
                }).then((_) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Successfully Added')));
                  snameController.clear();

                }).catchError((onError) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(onError)));
                });
              };
            },
    )

        ],
      ),
    );
  }
}

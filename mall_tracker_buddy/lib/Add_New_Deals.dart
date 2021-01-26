import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

class productupload extends StatefulWidget {

  @override
  _productuploadState createState() => _productuploadState();
}

class _productuploadState extends State<productupload> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                      "Add Deals of the Day",
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
                                      color: Color.fromRGBO(223, 202, 232, .3),
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
                                  child: product_details(),
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
      ),
    );
  }
}

final dbRef = FirebaseDatabase.instance.reference().child("ProductDetails");
class product_details extends StatefulWidget {

  @override
  _product_detailsState createState() => _product_detailsState();
}

class _product_detailsState extends State<product_details> {
  final _formKey = GlobalKey<FormState>();

  final ProductDescriptionController = TextEditingController();
  final ShopNameController = TextEditingController();

  var x;
  File _image;
  String _uploadedFileURL;
  Future chooseFile() async {
    await ImagePicker().getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = File(image.path);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Text('Selected Image'),
                _image != null
                    ? Image.asset(
                  _image.path,
                  height: 150,
                )
                    : Container(height: 150),
                _image == null
                    ? RaisedButton(
                  child: Text('Choose File'),
                  onPressed: chooseFile,
                  color: Colors.orangeAccent,
                )
                    : Container(),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: ShopNameController,
              decoration: InputDecoration(
                labelText: "Enter Shop Name",
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
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: ProductDescriptionController,
              decoration: InputDecoration(
                labelText: "Enter Shop Deals",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Shop Deals';
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
            onPressed: () async {
              await Firebase.initializeApp();
              if (_formKey.currentState.validate()) {
                try {
                  // Make random image name.
                  int randomNumber = Random().nextInt(100000);
                  String imageLocation = 'ShopDeals/image${randomNumber}${(_image
                      .path)}';
                  // Upload image to firebase.
                  final firebase_storage.Reference ref = firebase_storage
                      .FirebaseStorage.instance.ref().child(imageLocation);
                  await ref.putFile(_image).whenComplete(() {
                    ref.getDownloadURL().then((fileURL) {
                      _uploadedFileURL = fileURL;

                      dbRef.push().set({

                        "ProductDescription": ProductDescriptionController.text,
                        "ShopName": ShopNameController.text,

                        "image": _uploadedFileURL
                      }).then((_) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Successfully Added')));
                        ProductDescriptionController.clear();
                        ShopNameController.clear();

                      }).catchError((onError) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(onError)));
                      });
                    }
                    );
                  }
                  );
                } catch (e) {
                  print(e.message);
                }

              };
            },
          ),
        ],
      ),
    );
  }



}

import 'package:flutter/material.dart';
import 'package:mall_tracker_buddy/admin_panel.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container (
      alignment: Alignment.center,
        child:ListView(
          children: [
            Container(
              child: RaisedButton(
                child: Text("Admin Login"),
                onPressed: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => admin_panel()));
                },
              ),
            ),
            Container(
              child: RaisedButton(
                child: Text("User Login"),
                onPressed: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => admin_panel()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

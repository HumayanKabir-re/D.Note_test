import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:intl/date_symbol_data_local.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "D. Note",
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => new HomePage(),
        "/levels": (BuildContext context) => new BloodSugarLevel(),
        "/suggetions": (BuildContext context) => new Suggetions(),
        "/history": (BuildContext context) => new PatientHistory(),
        "/info": (BuildContext context) => new UserInfo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("D. Note"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Text(
                "Home",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: RaisedButton(
                  child: Text("Enter Blood Sugar Level"),
                  onPressed: () => Navigator.of(context).pushNamed("/levels"),
                )),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: RaisedButton(
                  child: Text("Show History"),
                  onPressed: () => Navigator.of(context).pushNamed("/history"),
                )),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: RaisedButton(
                  child: Text("Change Info"),
                  onPressed: () => Navigator.of(context).pushNamed("/info"),
                )),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: RaisedButton(
                child: Text("Exit"),
                color: Colors.red,
                onPressed: () => exit(0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BloodSugarLevel extends StatefulWidget {      //Changed BloodSugarLevel into a StatefulWidget
  
    _BloodSugarLevelState createState() => _BloodSugarLevelState(); 
}

 class _BloodSugarLevelState extends State<BloodSugarLevel> { //Changed from StateLessWidget to State
   String _timeString;  //New line
  final _scaffoldKey = GlobalKey<ScaffoldState>();

   @override
  void initState() {  //Added for Running Clock
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    // Removed Previous Static Clock Code from here

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("D. Note"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Text(
                "Blood Sugar Level",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(_timeString,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Level Before Eating"),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Level After Eating"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: RaisedButton(
                child: Text("Save"),
                onPressed: () => _displaySnackBar(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: RaisedButton(
                child: Text("Show Suggestions"),
                onPressed: () => Navigator.of(context).pushNamed("/suggetions"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: RaisedButton(
                  child: Text("Home"),
                  onPressed: () => Navigator.of(context).pushNamed("/home")),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: RaisedButton(
                  child: Text("Exit"),
                  color: Colors.red,
                  onPressed: () => exit(0),
                )),
          ],
        ),
      ),
    );
  }

  _displaySnackBar(BuildContext context) {    //For Showing Saving is done
    final snackBar = SnackBar(
      content: Text(
        "Saved",
        textAlign: TextAlign.center,
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  void _getTime(){    //Added After State Change for Running Clock
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }
  String _formatDateTime(DateTime dateTime){    //Added after State Change for runnign Clock
    return DateFormat("dd/MM/yyyy \t hh:mm:ss a").format(dateTime);
  }
}

class Suggetions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("D. Note"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Text(
                "Suggetions",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                  child: Text("Home"),
                  onPressed: () => Navigator.of(context).pushNamed("/home")),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: RaisedButton(
                child: Text("Exit"),
                color: Colors.red,
                onPressed: () => exit(0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PatientHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("D. Note"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Text(
                "History",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: RaisedButton(
                child: Text("Home"),
                onPressed: () => Navigator.of(context).pushNamed("/home"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: RaisedButton(
                child: Text("Exit"),
                color: Colors.red,
                onPressed: () => exit(0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("D. Note"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Text(
                "User Info",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: RaisedButton(
                child: Text("Save"),
                /*
                onPressed: () {
                  _displaySnackBar(context);
                  //final snackBar = SnackBar(content: Text("Saved"),);
                  //Scaffold.of(context).showSnackBar(snackBar);
                  //Scaffold.of(context).showSnackBar(SnackBar(content: Text("Saved"),));
                },
                */
                onPressed: () => _displaySnackBar(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: RaisedButton(
                  child: Text("Home"),
                  onPressed: () => Navigator.of(context).pushNamed("/home")),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: RaisedButton(
                  child: Text("Exit"),
                  color: Colors.red,
                  onPressed: () => exit(0),
                )),
          ],
        ),
      ),
    );
  }

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
        content: Text(
      "Saved",
      textAlign: TextAlign.center,
    ));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

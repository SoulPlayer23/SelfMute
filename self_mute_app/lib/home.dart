import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:self_mute_app/main.dart';
import 'package:self_mute_app/models/global.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String msg = "Press button to start listening";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: darkGreyColor,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  msg,
                  style: contextStyle,
                ),
                RaisedButton(
                  child: Text("Start"),
                  onPressed: _changeText(),
                  color: Colors.white,
                  textColor: redColor,
                  padding: EdgeInsets.all(8.0),
                  splashColor: redColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _changeText() {
    setState(() {
      if (msg.startsWith('L')) {
        msg = 'Press button to start listening';
      } else {
        msg = 'Listening for familiar sounds';
      }
    });
  }
}

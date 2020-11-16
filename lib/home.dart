import 'package:flutter/material.dart';
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
  bool running = false;

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              msg,
              textAlign: TextAlign.center,
              style: selfMuteStyle,
            ),
            SizedBox(
              height: 25,
            ),
            FlatButton(
              padding: EdgeInsets.all(15),
              color: running ? Colors.red : Colors.green,
              child: Text(
                running ? 'STOP' : 'START',
              ),
              onPressed: () {
                setState(
                  () {
                    running = running ? false : true;
                    _changeText();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  _changeText() {
    setState(
      () {
        if (!running) {
          msg = 'Press button to start listening';
        } else {
          msg = 'Listening for familiar sounds';
        }
      },
    );
  }
}

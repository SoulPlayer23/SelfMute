import 'package:flutter/material.dart';
import 'package:self_mute_app/models/global.dart';
import 'models/global.dart';
import 'keyword_page.dart';

final List<String> names = <String>[];

void main() {
  runApp(
    Home(),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String msg = 'Press button to start listening';
  bool running = false;

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        hintColor: mainColor,
        primaryColor: mainColor,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: bgColor,
          body: Builder(
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    msg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        color: mainColor,
                        fontSize: 35),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  color: running ? redColor : greenColor,
                  child: Text(
                    running ? 'STOP' : 'START',
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        running = running ? false : true;
                        _changeText();
                      },
                    );
                    if (running) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Background service running',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontStyle: FontStyle.italic,
                                fontSize: 20),
                          ),
                          backgroundColor: greenColor,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Background service stopped',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontStyle: FontStyle.italic,
                                fontSize: 20),
                          ),
                          backgroundColor: redColor,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: new Builder(
            builder: (BuildContext context) {
              return new FloatingActionButton(
                child: Icon(Icons.auto_stories),
                backgroundColor: running ? Colors.black26 : mainColor,
                onPressed: running
                    ? () {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Disabled while active',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20),
                            ),
                            backgroundColor: redColor,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    : () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => KeywordPage(),
                          ),
                        );
                      },
              );
            },
          ),
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

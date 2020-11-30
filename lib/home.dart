import 'package:flutter/material.dart';
import 'package:self_mute_app/models/global.dart';
import 'models/global.dart';

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
      home: Scaffold(
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
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: running
                        ? Text(
                            'The App is running',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontStyle: FontStyle.italic,
                                fontSize: 20),
                          )
                        : Text(
                            'The App has stopped',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontStyle: FontStyle.italic,
                                fontSize: 20),
                          ),
                    backgroundColor: mainColor,
                    duration: Duration(seconds: 2),
                  ));
                },
              )
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

class KeywordPage extends StatefulWidget {
  @override
  _KeywordPage createState() => _KeywordPage();
}

class _KeywordPage extends State<KeywordPage> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            'Keywords',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 50, bottom: 15),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Here',
                ),
                onChanged: (text) {
                  name = text;
                },
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 3),
              color: mainColor,
              child: Text(
                'ADD',
                style: TextStyle(
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    if (name != '') names.add(name);
                  },
                );
              },
            ),
            SizedBox(
              height: 11,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 3),
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Center(
                      child: Text(
                        '${names[index]}',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            color: bgColor,
                            fontSize: 30),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

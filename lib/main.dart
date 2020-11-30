import 'package:flutter/material.dart';
import 'package:self_mute_app/home.dart';
import 'dart:async';
import 'package:self_mute_app/models/global.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _SelfMuteState createState() => _SelfMuteState();
}

class _SelfMuteState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: bgColor,
          body: Center(
            child: Text(
              "MuteMe",
              style: TextStyle(
                  fontFamily: 'Cabin',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                  color: mainColor,
                  fontSize: 80),
            ),
          ),
        ),
      ),
    );
  }
}

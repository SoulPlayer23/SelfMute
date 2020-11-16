import 'package:flutter/material.dart';
import 'package:self_mute_app/home.dart';
import 'dart:async';
import 'package:self_mute_app/models/global.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
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
      Duration(seconds: 3),
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
      home: Scaffold(
        backgroundColor: darkGreyColor,
        body: Center(
          child: Text(
            "Self Mute",
            style: selfMuteStyle,
          ),
        ),
      ),
    );
  }
}

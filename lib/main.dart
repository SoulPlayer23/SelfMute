import 'package:flutter/material.dart';
import 'package:self_mute_app/home_page.dart';
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
        Navigator.of(context).pushReplacement(
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                scale: 1.25,
              ),
              Text(
                'MuteMe',
                style: TextStyle(
                    fontFamily: 'Cabin',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                    color: mainColor,
                    fontSize: 80),
              ),
              SizedBox(
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

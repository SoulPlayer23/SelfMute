import 'package:flutter/material.dart';
import 'package:self_mute_app/models/global.dart';

class KeywordList extends StatelessWidget {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      height: 100,
      decoration: BoxDecoration(
          color: redColor, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: TextField(
          style: TextStyle(color: redColor, fontSize: 60),
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 80),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/global.dart';
import 'home_page.dart';

class KeywordPage extends StatefulWidget {
  @override
  _KeywordPage createState() => _KeywordPage();
}

class _KeywordPage extends State<KeywordPage> {
  String name = '';
  final fieldText = TextEditingController();

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
                controller: fieldText,
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
                    fieldText.clear();
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
                  return GestureDetector(
                    onLongPress: () {
                      setState(
                        () {
                          names.removeAt(index);
                          HapticFeedback.vibrate();
                        },
                      );
                    },
                    child: Container(
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

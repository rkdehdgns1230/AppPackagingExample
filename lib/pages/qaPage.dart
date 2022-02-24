import 'package:flutter/material.dart';

class QAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Q&A Page',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          listTile('[New] Cross the line'),
          listTile('[Update] Where are you?'),
          listTile('[Update] new tap'),
          listTile('[Update] new Icon'),
        ],
      ),
    );
  }
}

Widget listTile(String text) {
  return ListTile(
    leading: Icon(Icons.add),
    title: Text(text,
      style: TextStyle(
         color: Colors.black,
         fontSize: 20.0,
         fontWeight: FontWeight.bold,
      )
    ),
    onTap: () {}
  );
}

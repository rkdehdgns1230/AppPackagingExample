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
    );
  }
}
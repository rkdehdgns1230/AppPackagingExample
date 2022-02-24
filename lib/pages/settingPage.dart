import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Setting page',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
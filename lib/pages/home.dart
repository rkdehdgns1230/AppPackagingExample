import 'loginPage.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Text('Aijoah',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              )),
              backgroundColor: Colors.black,
              radius: 60.0,
            ),
            SizedBox(
              height: 40.0,
            ),
            ButtonTheme(
              child: ElevatedButton(
                // ElevatedButton의 style 설정
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Text('LOGIN'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => LogInPage(),
                    ),);
                  print('nothing');
                }
              ),
            )
          ],
        )
      ),
    );
  }
}
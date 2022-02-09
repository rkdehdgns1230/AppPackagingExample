import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      title: 'Example Application',
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Example Application',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Aijoah',
              style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 1.0,
              )),
          CircleAvatar(
            backgroundColor: Colors.black26,
            radius: 60.0,
          ),
        ],
      ))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Kang"),
              accountEmail: Text("aaa@kw.ac.kr"),
              decoration: BoxDecoration(
                color: Colors.black26,
                // drawer header의 아래쪽 부드럽게 하는 부분
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
                color: Colors.black,
              ),
              title: Text('Home'),
              onTap: (){
                print('Home is touched!!');
              },
              trailing: Icon(Icons.add,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings,
                color: Colors.black,
              ),
              title: Text('Setting'),
              onTap: (){
                print('Setting is touched!!');
                Navigator.push(context, MaterialPageRoute(
                  builder:(context) => SettingPage(),
                ));
              },
              trailing: Icon(Icons.add,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(Icons.question_answer,
                color: Colors.black,
              ),
              title: Text('Q&A'),
              onTap: (){
                print('Q&A is touched!!');
                Navigator.push(context, MaterialPageRoute(
                  builder:(context) => QAPage(),
                ));
              },
              trailing: Icon(Icons.add,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
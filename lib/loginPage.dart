import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      // 여러 개의 TextField widget의 서식 관리를 위한 widget
      body: Builder(builder: (ctx) {
        return SingleChildScrollView(
          child: Form(
            child: Theme(
              data: ThemeData(
                primaryColor: Colors.black26,
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 15.0,
                )),
              ),
              child: Container(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: controller1,
                      decoration: InputDecoration(
                        labelText: "Enter ID",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      controller: controller2,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ButtonTheme(
                        minWidth: 100.0,
                        height: 50.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: Text('Enter'),
                          onPressed: () {
                            if (controller1.text == 'rkdehdgns1230' &&
                                controller2.text == 'fdc114') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => MainPage(),
                                ),
                              );
                            } else if (controller1.text == 'rkdehdgns1230') {
                              showSnackBar3(ctx);
                            } else if (controller2.text == 'fdc114') {
                              showSnackBar2(ctx);
                            } else {
                              showSnackBar1(ctx);
                            }
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

void showSnackBar1(BuildContext ctx){
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      content: Text('Please check your ID and PW'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    )
  );
}

void showSnackBar2(BuildContext ctx){
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      content: Text('Please check your ID'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    )
  );
}

void showSnackBar3(BuildContext ctx){
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      content: Text('Please check your PW'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    )
  );
}
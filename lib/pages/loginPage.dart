import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'chat_screen.dart';
import '../main.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // TextFiled에 입력된 데이터를 위한 TextEditingController 객체
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  String userName = '';
  String userPassword = '';
  final _authentication = FirebaseAuth.instance;

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
        return GestureDetector(
          // 화면 빈 공간 탭시 키보드 focus 해제하도록 구현
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
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
                      Text(
                        'WBC detector',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 35.0,
                        ),
                      ),
                      Text('Login',
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 25.0,
                          )),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextField(
                        // Login page 시작시 id 입력창에 auto focus 부여
                        autofocus: true,
                        controller: controller1,
                        decoration: InputDecoration(
                          labelText: "Enter ID",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value){
                          userName = value;
                        },
                      ),
                      TextField(
                        controller: controller2,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value){
                          userPassword = value;
                        },
                        obscureText: true,
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
                            child: Text('Login'),
                            // 버튼 클릭시 아이디 & 비밀번호 확인
                            onPressed: () async{
                              try {
                                final newUser = await _authentication.createUserWithEmailAndPassword(
                                  email: userName, password: userPassword
                                );
                                if(newUser.user != null){
                                  print('성공!'); // + 다음 페이지로 이동까지
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => ChatScreen(),
                                    )
                                  );
                                }
                              }
                              catch(exception){
                                print(exception);
                                // 시각적 정보 표현을 위해서 snack bar를 추가
                                ScaffoldMessenger.of(ctx).showSnackBar(
                                  SnackBar(
                                    content: Text('Please check your email and password'),
                                    backgroundColor: Colors.blue,
                                  )
                                );
                              }
                              /*
                              if (controller1.text == 'rkdehdgns1230' &&
                                  controller2.text == 'fdc114') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MainPage(),
                                  ),
                                );
                              } else if (controller1.text == 'rkdehdgns1230') {
                                showSnackBar3(ctx);
                              } else if (controller2.text == 'fdc114') {
                                showSnackBar2(ctx);
                              } else {
                                showSnackBar1(ctx);
                              }*/
                              
                            },
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// id, 비밀번호 잘못된 경우 스낵바
void showSnackBar1(BuildContext ctx) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    content: Text('Please check your ID and PW'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

// id 잘못된 경우 스낵바
void showSnackBar2(BuildContext ctx) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    content: Text('Please check your ID'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

// 비밀번호 잘못된 경우 스낵바
void showSnackBar3(BuildContext ctx) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    content: Text('Please check your PW'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

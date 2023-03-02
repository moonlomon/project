//외부라이브러리
import 'package:flutter/material.dart';

//내부패키지
import 'package:project/widgets/register.dart';
import 'package:project/widgets/home.dart';
import 'package:project/styles/mainstyle.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: mainTheme,
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var user = "" ;
  var userRegister = "";

  setUser(a){
    setState(() {
      user = a;
    });
  }

  setRegister() {
    if (user != "") {
      setState(() {
        userRegister = user;
      });
    } else {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("오류"),
          content: Text("소환사 이름을 입력해주세요"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    return;
                    },
                  child: Text("확인"),
                ),
              ],
            )
          ],
        );
      });
    }
  }

  resetRegister() {
    setState(() {
      userRegister = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return userRegister == "" ? RegisterWidget(setUser:setUser, setRegister:setRegister)
        : HomeWigdet(userRegister:userRegister, resetRegister:resetRegister);
  }
}

//외부라이브러리
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';

//내부패키지
import 'Providers/stores.dart';
import 'package:project/styles/mainstyle.dart';
import 'package:project/widgets/containers/mainContainer.dart';
import 'package:project/widgets/containers/registerPage.dart';

import 'firebase_options.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (c) => CalendarStore(),)
        ],

        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: mainTheme,
          home: const MyApp(),
        ),
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
      setState(() {
      });
    } else {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("오류", style: TextStyle(fontWeight: FontWeight.w700)),
          content: Text("소환사 이름을 입력해주세요"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                    Get.back();
                    return;
                  },
                  child: Text("확인"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
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
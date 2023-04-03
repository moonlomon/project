import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../../Providers/stores.dart';

getdata(user) async {
  final response = await http.post(
      Uri.parse('http://myteach.shop/user/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('안됨ㅅㄱ');
  }
}


class OurApp extends StatelessWidget {
  const OurApp({Key? key, this.resetRegister, this.userRegister, }) : super(key: key);

  final userRegister;
  final resetRegister;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: (){
              resetRegister();
            }
        ),
        title: Text("hihihihihi",
            style: TextStyle(fontWeight: FontWeight.w600,
                color:Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
      ),
      body: Center(child: TextButton(child: Text("불러오기"), onPressed: () async {
        try {
          final response = await getdata({"id":"9876", "password" : "1234"},);
          print(response);
          // 성공적인 처리를 위한 코드
        } catch (e) {
          // 예외 처리를 위한 코드
          print("");
          print("");
          print("에러메세지 : $e");
          print("");
          print("");
        }
      },
)
    ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/containers//mainContainer.dart';
import 'package:get/get.dart';
import 'package:project/widgets/containers/signup.dart';
import 'package:provider/provider.dart';

import '../../Providers/stores.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key, this.setUser, this.setRegister}) : super(key: key);

  final setUser;
  final setRegister;


  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {

  late String id;
  late String password;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("로그인", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          Container(
            padding: EdgeInsets.only(top:20, left: 20, right: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  id = value;
                });
              },
              decoration: InputDecoration(hintText: "아이디",hintStyle: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom:20, left: 20, right: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(hintText: "패스워드",hintStyle: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text("로그인",style: TextStyle(fontWeight: FontWeight.w500)),
                  onPressed: () {
                    var users = Provider.of<CalendarStore>(context, listen: false).users;
                    // find user by id and password
                    bool exists = users.any((user) => user.id == id && user.password == password);

                    if (exists) {
                      var user = users.firstWhere((user) => user.id == id && user.password == password);
                      Provider.of<CalendarStore>(context, listen: false).selectUser = user;
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("로그읜 성공", style: TextStyle(fontWeight: FontWeight.w700)),
                              content: Text("환영합니다 $id 님"),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                        Get.to(HomeWidget());
                                      },
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                                      child: Text("확인"),
                                    ),
                                  ],
                                )
                              ],
                            );
                          }
                      );
                    } else {
                      // user not found, show error message
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("로그읜 실패", style: TextStyle(fontWeight: FontWeight.w700)),
                              content: Text("아이디와 비밀번호를 확인주세요"),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                                      child: Text("확인"),
                                    ),
                                  ],
                                )
                              ],
                            );
                          }
                      );
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text("회원가입",style: TextStyle(fontWeight: FontWeight.w500)),
                  onPressed: () {
                    Get.to(SignUp());
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Providers/stores.dart';
import 'package:http/http.dart' as http;

import '../../providers/stores.dart' as stores1;



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String? inputId, inputPassWord, rePassWord= '';

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarStore>(
      builder: (context, provider, child) {

        var users = provider.users;
        var id = provider.id;
        var password = provider.password;

        return Scaffold(
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("회원가입", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                Container(
                  padding: EdgeInsets.only(top:20, left: 20, right: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    maxLength: 16,
                    onChanged: (value) {
                      setState(() {
                        inputId = value;
                      });
                    },
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return '값을 입력해주세요.';
                      }
                      if (value.length < 2) {
                        return '너무 짧아요';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "아이디",hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    maxLength: 16,
                    onChanged: (value) {
                      setState(() {
                        inputPassWord = value;
                      });
                    },
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return '값을 입력해주세요.';
                      }
                      if (value.length < 2) {
                        return '8자 이상 입력해주세요.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "비밀번호",hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom:20,left: 20, right: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    maxLength: 16,
                    onChanged: (value) {
                      setState(() {
                        rePassWord = value;
                      });
                    },
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return '값을 입력해주세요.';
                      }
                      if (inputPassWord != rePassWord) {
                        return '비밀번호를 확인해주세요';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "비밀번호 확인",hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Text("가입완료",style: TextStyle(fontWeight: FontWeight.w500)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) { // _formKey 사용
                            _formKey.currentState!.save();
                            id = inputId!;
                            password = inputPassWord!;
                            setState(() {});
                          } else {
                            inputId = null;
                            inputPassWord = null;
                            rePassWord = null;
                          }
                          userInfo newUser = userInfo(id: inputId, password: inputPassWord);
                          String jsonString = jsonEncode(newUser);
                          Map<String,dynamic> jsonData = jsonDecode(jsonString);
                          try {
                            final response = await Provider.of<stores1.SignUpStore>(context, listen: false).getdata(jsonData);
                            if (response['msg'] == 'Success') {
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("가입완료", style: TextStyle(fontWeight: FontWeight.w700)),
                                  content: Text("환영합니다"),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                            Get.back();
                                          },
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                                          child: Text("확인"),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              });
                            } else {
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("오류", style: TextStyle(fontWeight: FontWeight.w700)),
                                  content: Text("가입된 아이디입니다."),
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
                              });
                            }
                            // 성공적인 처리를 위한 코드
                          } catch (e) {
                            // 예외 처리를 위한 코드
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text("오류", style: TextStyle(fontWeight: FontWeight.w700)),
                                content: Text("다시 입력해주세요\n오류코드: $e"),
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
                            });
                          }
                        //   setState(() {
                        //     bool exists = users.any((user) => user.id == newUser.id);
                        //     if (exists) {
                        //       showDialog(context: context, builder: (context){
                        //         return AlertDialog(
                        //           title: Text("오류", style: TextStyle(fontWeight: FontWeight.w700)),
                        //           content: Text("가입된 아이디입니다."),
                        //           actions: [
                        //             Row(
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: [
                        //                 ElevatedButton(
                        //                   onPressed: () {
                        //                     Get.back();
                        //                   },
                        //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                        //                   child: Text("확인"),
                        //                 ),
                        //               ],
                        //             )
                        //           ],
                        //         );
                        //       });
                        //     } else {
                        //       users.add(newUser);
                        //       showDialog(context: context, builder: (context){
                        //         return AlertDialog(
                        //           title: Text("가입완료", style: TextStyle(fontWeight: FontWeight.w700)),
                        //           content: Text("환영합니다"),
                        //           actions: [
                        //             Row(
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: [
                        //                 ElevatedButton(
                        //                   onPressed: () {
                        //                     Get.back();
                        //                   },
                        //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                        //                   child: Text("확인"),
                        //                 ),
                        //               ],
                        //             )
                        //           ],
                        //         );
                        //       });
                        //     }
                        //   });
                        //   // final response = getdata(jsonEncode([{'id': "sjmun0420", 'password': "1234"}]));
                        // },

                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black54,
                        ),
                        child: Text("나가기",style: TextStyle(fontWeight: FontWeight.w500)),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        );
      },
    );
  }
}



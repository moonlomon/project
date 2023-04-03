import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/stores.dart';

class ChangePW extends StatefulWidget {
  const ChangePW({Key? key}) : super(key: key);

  @override
  State<ChangePW> createState() => _ChangePWState();
}

class _ChangePWState extends State<ChangePW> {
  @override
  Widget build(BuildContext context) {

    userInfo user = Provider.of<CalendarStore>(context, listen: false).selectUser;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              }),
        title: Text("비밀번호 변경"),
        backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom:20, left: 20, right: 20),
            child: TextFormField(
              onChanged: (text) {
                setState(() {

                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '이전 비밀번호',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom:20, left: 20, right: 20),
            child: TextFormField(
              onChanged: (text) {
                setState(() {

                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '새 비밀번호',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom:20, left: 20, right: 20),
            child: TextFormField(
              onChanged: (text) {
                setState(() {

                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '비밀번호 확인',
              ),
            ),
          ),
          ElevatedButton(
                onPressed: () {
                  setState(() {
                    user.password = "12341234";
                  });
                  print(user.password);
                  // Get.back();
                },
                child: const Text("비밀번호변경"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black54)
              ),
        ],
      ),
    );
  }
}

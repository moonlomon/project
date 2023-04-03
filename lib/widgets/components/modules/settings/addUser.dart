import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/stores.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
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
        title: Text("유저정보 입력"),
        backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(bottom:20, left: 20, right: 20),
                child: TextField(
                  onChanged: (text) {
                    setState(() {

                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '소환사 이름',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    user.nickname = "우엉이우어어엉";
                    user.tier = "https://seongjun2moon.github.io/tier/iron.png";
                    user.win_rate = "43%";
                    user.most = "https://seongjun2moon.github.io/chanpionsA-Q/Ahri.png";
                    user.level = "133";
                  });
                  print(user.id);
                  print(user.password);
                  print(user.nickname);
                  print(user.tier);
                  print(user.win_rate);
                  print(user.most);
                  print(user.level);
                  // Get.back();
                },
                child: const Text("유저정보넣기"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black54)
              ),
            ],
          ),
    );
  }
}

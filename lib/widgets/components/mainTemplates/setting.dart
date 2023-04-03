import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Providers/stores.dart';
import 'package:project/widgets/components/modules/settings/addUser.dart';
import 'package:project/widgets/components/modules/settings/changePW.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {

  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    userInfo user = Provider.of<CalendarStore>(context, listen: false).selectUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          }
      ),
      title: const Text("Settings"),
      backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
      elevation: 0,
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.grey[850],
            ),
            title: Text('유저정보입력', style: TextStyle(color: Colors.grey[850])),
            onTap: () {
              Get.to(AddUser());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.grey[850],
            ),
            title: Text('비밀번호변경', style: TextStyle(color: Colors.grey[850])),
            onTap: () {
              Get.to(ChangePW());
            },
          ),
        ],
      )

      // Center(
      //   child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Container(
      //               // padding: const EdgeInsets.only(right: 10),
      //               child: ElevatedButton(
      //                 onPressed: () {
      //                   Get.to(AddUser());
      //                 },
      //                 child: const Text("유저정보넣기"),
      //               ),
      //             ),
      //             Container(
      //               // padding: const EdgeInsets.only(left: 10),
      //               child: ElevatedButton(
      //                 onPressed: () {
      //                   Get.to(ChangePW());
      //                 },
      //                 child: const Text("비밀번호변경"),
      //               ),
      //             ),
      //           ],
      //         ),
      // ),
    );
  }
}
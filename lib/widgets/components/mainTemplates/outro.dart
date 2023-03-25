import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../../Providers/stores.dart';

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
      body: Center(child: TextButton(child: Text("불러오기"), onPressed: ()=> context.read<CalendarStore>().getDate(),),)

    );
  }
}

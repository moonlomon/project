import 'package:flutter/material.dart';

import '../../../database/cloudfirebase.dart';

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
        title: Text("${userRegister}",
            style: TextStyle(fontWeight: FontWeight.w600,
                color:Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
      ),
      body: Center(
        child: Text("hi"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project/widgets/frames/home.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key, this.setUser, this.setRegister}) : super(key: key);

  final setUser;
  final setRegister;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        backgroundColor: Colors.deepOrange,
        onPressed: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("소환사등록", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              onChanged: (text) {
                setUser(text);
              },
              decoration: InputDecoration(hintText: "소환사이름",hintStyle: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black45,
            ),
            child: Text("등록",style: TextStyle(fontWeight: FontWeight.w500)),
            onPressed: () {
              setRegister();
            },
          )
        ],
      ),
    );
  }
}

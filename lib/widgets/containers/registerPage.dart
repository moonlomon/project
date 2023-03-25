import 'package:flutter/material.dart';
import 'package:project/widgets/containers//mainContainer.dart';

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
            padding: EdgeInsets.only(top:20, left: 20, right: 20),
            child: TextField(
              onChanged: (text) {},
              decoration: InputDecoration(hintText: "아이디",hintStyle: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              onChanged: (text) {},
              decoration: InputDecoration(hintText: "패스워드",hintStyle: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom:20,left: 20, right: 20),
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

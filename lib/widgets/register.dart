import 'package:flutter/material.dart';
import 'package:project/widgets/home.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key, this.setUser, this.setRegister}) : super(key: key);

  final setUser;
  final setRegister;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("소환사등록", style: TextStyle(fontSize: 20)),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              onChanged: (text) {
                setUser(text);
              },
              decoration: InputDecoration(hintText: "소환사이름 등록"),
            ),
          ),
          ElevatedButton(
            child: Text("등록"),
            onPressed: () {
              setRegister();
            },
          )
        ],
      ),
    );
  }
}

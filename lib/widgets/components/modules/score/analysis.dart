import 'package:flutter/material.dart';

class analysis extends StatelessWidget {
  const analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (c, i) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Image.network('https://codingapple1.github.io/kona.jpg'),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 600),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('분석내용'),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

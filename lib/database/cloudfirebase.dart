import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  getData() async {
    var result = await firestore.collection('schedule').get(); //get 앞에 where 넣어서 조건검색 가능
    List lst = [];
    for (var doc in result.docs){
      lst.add(doc.data());
    }
    print(lst);
  }

  addData() async {
    var result = await firestore.collection('schedule').doc('gm40kp7ABsImFH8vU455').update({'endtime': 1400, 'starttime': 1200,});
  }


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   addData();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child:Text("버튼"),
          onPressed: (){
            getData();
          },
        ),
      ),
    );
  }
}

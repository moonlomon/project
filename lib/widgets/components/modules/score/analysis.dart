import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/stores.dart';

class analysis extends StatelessWidget {
  const analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CalendarStore calendarStore = Provider.of<CalendarStore>(context, listen: false);
    List<Map<String, String>> plays = Provider.of<CalendarStore>(context, listen: false).analysis;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: (){
              // Navigator.pop(context);
              Get.back();
            }
        ),
        title: Text("AI분석"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (c, i) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Image.network(plays[i]['anlysisUrl']??calendarStore.anlysis),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 600),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plays[i]['explain']??calendarStore.explain),
                  ],
                ),
              ),
              SizedBox(child: IconButton(onPressed:(){} ,icon: Icon(Icons.play_arrow), color: Colors.black),)
            ],
          );
        },
      ),
    );
  }
}

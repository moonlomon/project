//외부라이브러리
import 'package:flutter/material.dart';


//내부패키지

import '../components/mainTemplates/calendar.dart';
import '../components/mainTemplates/outro.dart';
import '../components/mainTemplates/score.dart';
import '../components/modules/main/memo.dart';





class HomeWigdet extends StatefulWidget {
  const HomeWigdet({Key? key, this.userRegister, this.resetRegister}) : super(key: key);

  final userRegister;
  final resetRegister;


  @override
  State<HomeWigdet> createState() => _HomeWigdetState();
}

class _HomeWigdetState extends State<HomeWigdet> {
  List<dynamic> widgetSelector = [ScheduleWidget(), RecordWidget(), CalendarWidget(), OurApp()];
  // List<dynamic> widgetSelector = [Text("1"), Text("1"), Text("1"), Text("1"),];
  var tap = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: (){
              widget.resetRegister();
            }
        ),
        title: Text(widget.userRegister, style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),

      body: Center(child: widgetSelector[tap]),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() {
            tap = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: '홈',),
          BottomNavigationBarItem(icon: Icon(Icons.score),label: 'kda'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: '일정'),
          BottomNavigationBarItem(icon: Icon(Icons.question_mark),label: '어플설명'),
        ],
      )
    );
  }
}

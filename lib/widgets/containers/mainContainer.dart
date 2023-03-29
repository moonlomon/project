//외부라이브러리
import 'package:flutter/material.dart';

//내부패키지
import 'package:project/widgets/components/mainTemplates/calendar.dart';
import 'package:project/widgets/components/mainTemplates/outro.dart';
import 'package:project/widgets/components/mainTemplates/score.dart';
import 'package:project/widgets/components/mainTemplates/infoMemo.dart';





class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, this.userRegister, this.resetRegister}) : super(key: key);

  final userRegister;
  final resetRegister;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  var tap = 0;

  @override
  Widget build(BuildContext context) {

  List<dynamic> widgetSelector = [
    InfoMemoMain(),
    RecordWidget(userRegister:widget.userRegister, resetRegister:widget.resetRegister),
    CalendarWidget(userRegister:widget.userRegister, resetRegister:widget.resetRegister),
    OurApp(userRegister:widget.userRegister, resetRegister:widget.resetRegister)
  ];

    return Scaffold(
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
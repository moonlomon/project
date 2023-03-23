//외부 라이브러리
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

//내부 패키지
import '../../../Providers/stores.dart';
import '../modules/calenedar/calendarWidgets/addSchedule.dart';
import '../modules/calenedar/calendarWidgets/main_calenedar.dart';
import '../modules/calenedar/calendarWidgets/schedule_card.dart';
import '../modules/calenedar/calendarWidgets/today.dart';


class CalendarWidget extends StatefulWidget {
  CalendarWidget({Key? key, this.resetRegister, this.userRegister}) : super(key: key);

  final resetRegister;
  final userRegister;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {

  List<Map<String,dynamic>> lst = [
    {'key':1, 'date':DateTime.utc(2023, 03, 22), 'startTime':12, 'endTime':14, 'content':'코딩'},
    {'key':1, 'date':DateTime.utc(2023, 03, 23), 'startTime':1, 'endTime':3, 'content':'과제'},
    {'key':1, 'date':DateTime.utc(2023, 03, 24), 'startTime':1, 'endTime':3, 'content':'팀플'},
  ];

  @override
  Widget build(BuildContext context) {

    DateTime selectedDate = context.watch<CalendarStore>().selectedDate;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.watch<CalendarStore>().SUB_COLOR,
        onPressed: (){
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => ScheduleBottomSheet(lst:lst,selectedDate:selectedDate),
            isScrollControlled: true
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: (){
              widget.resetRegister();
            }
        ),
        title: Text("${widget.userRegister}",
            style: TextStyle(fontWeight: FontWeight.w600,
                color:Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
      ),
      body: MainCalendarScreen(lst:lst),
    );
  }
}

class MainCalendarScreen extends StatefulWidget {
  const MainCalendarScreen({Key? key, this.userRegister, this.resetRegister, this.lst}) : super(key: key);

  final userRegister;
  final resetRegister;
  final lst;

  @override
  State<MainCalendarScreen> createState() => _MainCalendarScreenState();
}

class _MainCalendarScreenState extends State<MainCalendarScreen> {


  late DateTime selectedDate;
  List<Map<String, dynamic>> filteredLst = [];


  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    updateFilteredLst();
  }


  void updateFilteredLst() {
    setState(() {
      filteredLst =
          widget.lst.where((item) => item['date'] == selectedDate).toList();
    });
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      context.read<CalendarStore>().selectedDate = this.selectedDate;
      this.selectedDate = selectedDate;
      updateFilteredLst();
    });
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Column(
          children: [
            MainCalenedar(selectedDate: selectedDate, onDaySelected: onDaySelected,),
            SizedBox(height: 8.0,),
            TodayBanner(selectedDate:selectedDate, count:0),
            SizedBox(height: 8.0,),
            Expanded(
              child: ListView.builder(
                        itemCount: filteredLst.length,
                        itemBuilder: (c, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 8.0, right: 8.0
                            ),
                            child: ScheduleCard(
                              startTime: filteredLst[i]['startTime'],
                              endTime: filteredLst[i]['endTime'],
                              content: filteredLst[i]['content'],
                            ),
                          );
                        },
                      ),
            )
          ],
        )
    );
  }
}

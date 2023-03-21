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


class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.watch<CalendarStore>().SUB_COLOR,
        onPressed: (){
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => ScheduleBottomSheet(),
            isScrollControlled: true
          );
        },
        child: Icon(Icons.add),
      ),
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        children: [
          MainCalenedar(selectedDate: selectedDate, onDaySelected: onDaySelected,),
          SizedBox(height: 8.0,),
          TodayBanner(
            selectedDate:selectedDate,
            count:0
          ),
          SizedBox(height: 8.0,),
          Expanded(
            child: StreamBuilder(
              stream: context.watch<CalendarStore>().fetchFirstUser(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (c, i) {
                    final schedule = snapshot.data![i];
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8.0, left: 8.0, right: 8.0
                      ),
                      child: ScheduleCard(
                        startTime: schedule['starttime'],
                        endTime: schedule['endtime'],
                        content: schedule['content'],
                      ),
                    );
                  },
                );
              }
            ),
          )
        ],
      )
    );
  }
}



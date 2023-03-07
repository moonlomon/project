import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:table_calendar/table_calendar.dart';

import '../../Providers/stores.dart';

class TodayBanner extends StatelessWidget {
  const TodayBanner({Key? key, required this.selectedDate, required this.count}) : super(key: key);

  final DateTime selectedDate;
  final int count;


  @override
  Widget build(BuildContext context) {

    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Container(
      color: context.watch<CalendarStore>().FRIMARY_COLOR,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일",
              style: textStyle,
            ),
            Text(
              '$count개', style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}

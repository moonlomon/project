import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../Providers/stores.dart';


class MainCalenedar extends StatelessWidget {
  const MainCalenedar({Key? key, required this.onDaySelected, required this.selectedDate}) : super(key: key);

  final OnDaySelected onDaySelected;
  final DateTime selectedDate;


  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_kr',
      onDaySelected: onDaySelected,
      selectedDayPredicate: (date) =>
      date.year == selectedDate.year &&
          date.month
              == selectedDate.month &&
          date.day == selectedDate.day,
      firstDay: DateTime(1800, 1, 1),
      lastDay: DateTime(3000, 1, 1),
      focusedDay: DateTime.now(),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: context.watch<CalendarStore>().LIGHT_GREY_COLOR,
        ),
        weekendDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: context.watch<CalendarStore>().LIGHT_GREY_COLOR,
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: context.watch<CalendarStore>().FRIMARY_COLOR,
            width: 1.0,
          ),
        ),
        defaultTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: context.watch<CalendarStore>().DARK_GREY_COLOR,
        ),
        weekendTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: context.watch<CalendarStore>().DARK_GREY_COLOR,
        ),
        selectedTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: context.watch<CalendarStore>().FRIMARY_COLOR,
        ),
      ),
    );
  }
}

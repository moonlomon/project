import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Providers/stores.dart';


class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key,
    required this.startTime,
    required this.endTime,
    required this.content}) : super(key: key);

  final int startTime;
  final int endTime;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8, left: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: context.watch<CalendarStore>().SUB_COLOR,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Time(
                startTime: startTime,
                endTime: endTime,
              ),
              SizedBox(width: 16.0),
              _Content(
                content: content,
              ),
              SizedBox(width: 16.0)
            ],
          ),
        ),
      ),
    );
  }
}


class _Time extends StatelessWidget {
  const _Time({Key? key, required this.startTime, required this.endTime}) : super(key: key);

  final int startTime;
  final int endTime;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: context.watch<CalendarStore>().FRIMARY_COLOR,
      fontSize: 16.0
    );

    return Column(
      children: [
        Text(
          "${startTime.toString().padLeft(2, '0')}:00",
          style: textStyle,
        ),
        Text(
          "${endTime.toString().padLeft(2, '0')}:00",
          style: textStyle.copyWith(
            fontSize: 10.0
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        content,
      ),
    );
  }
}

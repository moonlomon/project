import 'package:flutter/material.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          color: Colors.black87,
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.white60,
          ),
        )
      ],
    );
  }
}
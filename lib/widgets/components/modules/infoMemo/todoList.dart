import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/stores.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(5),
        color: context.watch<CalendarStore>().LIGHT_GREY_COLOR,
        width: double.infinity,
        height: 100,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text("TodoList", style: TextStyle(fontSize: 28)),
              ),
              Expanded(
                flex: 3,
                child: Text("투두리스트"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

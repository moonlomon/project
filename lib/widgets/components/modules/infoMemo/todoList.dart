import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Providers/stores.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {

  List<Map<String,dynamic>> lst = [
    {'key':1, 'date':DateTime.utc(2023, 03, 22), 'startTime':12, 'endTime':14, 'content':'코딩'},
    {'key':1, 'date':DateTime.utc(2023, 03, 23), 'startTime':1, 'endTime':3, 'content':'과제'},
    {'key':1, 'date':DateTime.utc(2023, 03, 24), 'startTime':1, 'endTime':3, 'content':'팀플'},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Container(
          color: context.watch<CalendarStore>().LIGHT_GREY_COLOR,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text("23.03.24. TodoList", style: TextStyle(fontSize: 28)),
              ),
              HowTiles(lst: lst,),
            ],
          ),
        ),
      ),
    );
  }
}
class HowTiles extends StatefulWidget {
  const HowTiles({Key? key, required this.lst}) : super(key: key);

  final List lst;

  @override
  State<HowTiles> createState() => _HowTilesState();
}

class _HowTilesState extends State<HowTiles> {


  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      widget.lst;
    });
  }

  @override
  Widget build(BuildContext context) {

    var answer;

    if (widget.lst.length == 1) {
      answer =  TodoTile(content: widget.lst[0]['content']);
    } else if(widget.lst.length == 2) {
      answer =  Column(children: [TodoTile(content: widget.lst[0]['content']),TodoTile(content: widget.lst[1]['content'])],);
    }
    else if(widget.lst.length >= 3){
      answer =  Column(children: [TodoTile(content: widget.lst[0]['content']),TodoTile(content: widget.lst[1]['content']), IconButton(onPressed:(){},icon: FaIcon(FontAwesomeIcons.ellipsis))],);
    }

    return answer;
  }
}


class TodoTile extends StatelessWidget {
  const TodoTile({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 8, left: 8, bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: context.watch<CalendarStore>().SUB_COLOR,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.square_outlined),
        title: Text(content),
      ),
    );
  }
}

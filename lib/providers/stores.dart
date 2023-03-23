import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class CalendarStore extends ChangeNotifier {

  late DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  var RegistUser;

  final FRIMARY_COLOR = Colors.deepOrange;
  final LIGHT_GREY_COLOR = Colors.grey[200]!;
  final DARK_GREY_COLOR = Colors.grey[600]!;
  final TEXT_FIELD_FILL_COLOR = Colors.grey[300]!;
  final SUB_COLOR = Color.fromRGBO(58, 44, 34, 1.0);

  final firestore = FirebaseFirestore.instance;

  addData(startTime, endTime, content) async {
    await firestore.collection('schedule').add({'endtime': endTime, 'starttime': startTime, 'content' : content});
  }

  removeData(doc) async {
    await firestore.collection('schedule').doc(doc).delete();
  }

  Stream fetchFirstUser() async* {
    var results = await firestore.collection('schedule').get(); //get 앞에 where 넣어서 조건검색 가능
    List lst = [];
    for (var doc in results.docs){
      lst.add(doc.data());
    }
    yield lst;
  }

  List records = [{
    "uuid": 1,
    "result": "승리",
    "time": "00:28:44",
    "champion": "Gragas",
    "position": "Jungle",
    "kda": "7/3/12"
  }, {
      "uuid": 1,
      "result": "패배",
      "time": "00:34:17",
      "champion": "Tristana",
      "position": "Bottom",
      "kda": "4/5/6"
    }, {
      "uuid": 1,
      "result": "승리",
      "time": "00:25:53",
      "champion": "Renekton",
      "position": "Top",
      "kda": "10/2/4"
    }, {
      "uuid": 1,
      "result": "승리",
      "time": "00:31:28",
      "champion": "Lulu",
      "position": "Support",
      "kda": "1/1/22"
    }, {
      "uuid": 1,
      "result": "승리",
      "time": "00:21:42",
      "champion": "Ashe",
      "position": "Bottom",
      "kda": "8/2/6"
    },
    {
      "uuid": 1,
      "result": "패배",
      "time": "00:29:16",
      "champion": "Ryze",
      "position": "Middle",
      "kda": "3/4/1"
    }, {
      "uuid": 1,
      "result": "패배",
      "time": "00:26:08",
      "champion": "Jax",
      "position": "Top",
      "kda": "1/5/0"
    }, {
      "uuid": 1,
      "result": "패배",
      "time": "00:21:03",
      "champion": "Twitch",
      "position": "Bottom",
      "kda": "0/6/3"
    }, {
      "uuid": 1,
      "result": "승리",
      "time": "00:35:21",
      "champion": "Annie",
      "position": "Middle",
      "kda": "9/4/5"
    }, {
      "uuid": 1,
      "result": "승리",
      "time": "00:37:44",
      "champion": "LeeSin",
      "position": "Jungle",
      "kda": "10/3/9"
    }, {
      "uuid": 1,
      "result": "승리",
      "time": "00:26:11",
      "champion": "Sivir",
      "position": "Bottom",
      "kda": "13/1/1"
    }, {
      "uuid": 1,
      "result": "승리",
      "time": "00:28:44",
      "champion": "Gragas",
      "position": "Jungle",
      "kda": "7/3/12"
    }, {
      "uuid": 1,
      "result": "패배",
      "time": "00:34:17",
      "champion": "Tristana",
      "position": "Bottom",
      "kda": "4/5/6"
    },
    {
      "uuid": 1,
      "result": "승리",
      "time": "00:25:53",
      "champion": "Renekton",
      "position": "Top",
      "kda": "10/2/4"
    }, {
      "uuid": 1,
      "result": "승리",
      "time": "00:31:28",
      "champion": "Lulu",
      "position": "Support",
      "kda": "1/1/22"
    }, {
      "uuid": 1,
      "result": "승리",
      "time": "00:21:42",
      "champion": "Ashe",
      "position": "Bottom",
      "kda": "8/2/6"
    }, {
      "uuid": 1,
      "result": "패배",
      "time": "00:29:16",
      "champion": "Ryze",
      "position": "Middle",
      "kda": "3/4/1"
    }, {
      "uuid": 1,
      "result": "패배",
      "time": "00:26:08",
      "champion": "Jax",
      "position": "Top",
      "kda": "1/5/0"
    }, {
      "uuid": 1,
      "result": "패배",
      "time": "00:21:03",
      "champion": "Twitch",
      "position": "Bottom",
      "kda": "0/6/3"
    }, {
      "uuid": 1,
      "result": "승리",
      "time": "00:23:57",
      "champion": "Braum",
      "position": "Support",
      "kda": "1/0/22"
    }
  ];

  List memos = [
    {'title': 'html', 'content': 'use html'},
    {'title': 'JS', 'content': 'use JS'},
    {'title': 'Python', 'content': 'Python is a popular programming language'},
    {'title': 'Java', 'content': 'Java is a widely-used programming language'},
    {'title': 'C++', 'content': 'C++ is a powerful and fast programming language'},
    {'title': 'JavaScript', 'content': 'JavaScript is a scripting language used in web development'},
    {'title': 'SQL', 'content': 'SQL is a language used to manage and manipulate databases'},
    {'title': 'PHP', 'content': 'PHP is a server-side scripting language used for web development'},
    {'title': 'Ruby', 'content': 'Ruby is a dynamic and object-oriented programming language'}
  ];


}

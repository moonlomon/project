import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../widgets/containers/mainContainer.dart';

class CardModel {
  final int key;
  final DateTime date;
  final int startTime;
  final int endTime;
  final String content;

  CardModel({
    required this.key,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.content
  });
}

class userInfo with ChangeNotifier {
  final String? id;
  late String? password;
  late String? nickname;
  late String? tier;
  late String? win_rate;
  late String? most;
  late String? level;

  userInfo({
    required this.id,
    required this.password,
    this.nickname,
    this.tier,
    this.win_rate,
    this.most,
    this.level,
});

  setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  setNickname(String nickname) {
    this.nickname = nickname;
    notifyListeners();
  }

  setTier(String tier) {
    this.tier = tier;
    notifyListeners();
  }

  setWinRate(double winRate) {
    this.win_rate = win_rate;
    notifyListeners();
  }

  setMost(String most) {
    this.most = most;
    notifyListeners();
  }

  setLevel(String level) {
    this.level = level;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'password': password,
    'nickname': nickname,
    'tier': tier,
    'win_rate': win_rate,
    'most': most,
    'level': level,
  };

  factory userInfo.fromJson(Map<String, dynamic> json) {
    return userInfo(
      id: json['id'],
      password: json['password'],
      nickname: json['nickname'],
      tier: json['tier'],
      win_rate: json['win_rate'],
      most: json['most'],
      level: json['level'],
    );
  }
}


class SignUpStore extends ChangeNotifier {
  getdata(user) async {
    final response = await http.post(
        Uri.parse('http://myteach.shop/user/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('안됨ㅅㄱ');
    }
  }
}



class CalendarStore extends ChangeNotifier {


  // url 데이터
  getDate() async {
    var result = await http.get(Uri.parse('http://myteach.shop/'));
    return result;
  }


  // 회원가입&로그인 데이터
  late String _id = '';
  String get id => _id;
  set id(String value) {
    _id = value;
    notifyListeners();
  }

  late String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  List<userInfo> _users = [
    userInfo(id:'sjmun0420', password: '1234')
  ];
  List<userInfo> get users => _users;
  set users(List<userInfo> value) {
    _users = value;
    notifyListeners();
  }

  late userInfo _selectUser;
  userInfo get selectUser => _selectUser;
  set selectUser(userInfo value) {
    _selectUser = value;
    notifyListeners();
  }





  // 유저정보 데이터
  // String level = "레벨";
  // String tear = 'https://seongjun2moon.github.io/tier/gold.png';
  // String rate = "43%";
  // String most = 'https://seongjun2moon.github.io/chanpionsA-Q/Ahri.png';





  // 캘린더 데이터
  late DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  var RegistUser;

  late List<CardModel> _lst = [
    CardModel(key: 1, date: DateTime.utc(2023, 04, 22), startTime: 12, endTime: 14, content: '코딩'),
    CardModel(key:1, date:DateTime.utc(2023, 04, 23), startTime:1, endTime:3, content:'과제'),
    // CardModel(key:1, date:DateTime.utc(2023, 03, 24), startTime:1, endTime:3, content:'팀플'),
  ];
  List<CardModel> get lst => _lst;
  set lst(List<CardModel> value) {
    _lst = value;
    notifyListeners();
  }




  // 공용 데이터
  final FRIMARY_COLOR = Colors.deepOrange;
  final LIGHT_GREY_COLOR = Colors.grey[200]!;
  final DARK_GREY_COLOR = Colors.grey[600]!;
  final TEXT_FIELD_FILL_COLOR = Colors.grey[300]!;
  final SUB_COLOR = Color.fromRGBO(58, 44, 34, 1.0);




  // 분석 데이터
  String explain = '우리팀 원딜 바텀에 혼자 있었음, 상대팀 미드와 상대팀 정글이 바텀에서 원딜 죽임\n'
      '우리팀 탑이 탑에 있음, 상대팀 탑이 탑에 있음\n'
      '상대 원딜이 미드에 있음, 상대 서폿은 보이지 않음 그치만 원딜 근처에 있을 확률 높음\n'
      '그럼에도 원딜을 죽일려다 2대2 교전에서 사망';
  String anlysis = 'https://seongjun2moon.github.io/tier/test.gif';
  List<Map<String,String>> analysis = [
    {
      "explain": "적이 시야가 보이지 않는 곳에서 적이 왔고 거리조절 및 상황 대처를 잘하였으나 상대방의 침착한 대응으로 인한 사망",
      "anlysisUrl": "https://seongjun2moon.github.io/analysis/sight.gif"
    },
    {
      "explain": "아군 지원을 가는 도중 아군이 사망하여 도망 가려고 하였지만 상대방의 추격으로 인한 사망.\n"
          "상황이 종결 된 곳을 지원 가는 것 보단 미드라인 밀고 반대 방향 시야를 잡는 것이 좋았음.",
      "anlysisUrl": "https://seongjun2moon.github.io/analysis/chase.gif"
    },
    {
      "explain": "상대방의 체력이 많이 없어 먼저 자르고 시작하려다 상대 진형으로 이동이 되어 순식간에 집중 공격을 당해 사망하게 되었음.\n"
      "첫 진입 후 어차피 죽는 적군이였기에 거리를 조절하는 것 이 좋았음.",
      "anlysisUrl": "https://seongjun2moon.github.io/analysis/cut.gif"
    },
    {
      "explain": "주변에 아군의 지원이 3명 가능하기 때문에 전진 하였지만 시야가 안보이는 곳에서 적군 4명이 나오며\n"
      "집중공격 당해 몰리며 점멸 사용도 못하면서 사망하였음. 경계의식이 필요 함.",
      "anlysisUrl": "https://seongjun2moon.github.io/analysis/four.gif"
    },{},{},{}
  ];




  // 전적데이터
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



  // 파이어베이서 데이터
  // final firestore = FirebaseFirestore.instance;

  // addData(startTime, endTime, content) async {
  //   await firestore.collection('schedule').add({'endtime': endTime, 'starttime': startTime, 'content' : content});
  // }
  //
  // removeData(doc) async {
  //   await firestore.collection('schedule').doc(doc).delete();
  // }
  //
  // Stream fetchFirstUser() async* {
  //   var results = await firestore.collection('schedule').get(); //get 앞에 where 넣어서 조건검색 가능
  //   Lis  t lst = [];
  //   for (var doc in results.docs){
  //     lst.add(doc.data());
  //   }
  //   yield lst;
  // }
}

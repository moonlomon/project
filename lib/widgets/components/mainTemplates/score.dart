// 외부 라이브러리
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

//내부 위젯
import '../../../Providers/stores.dart';
import '../modules/score/analysis.dart';

class RecordWidget extends StatelessWidget {
  RecordWidget({Key? key}) : super(key: key);

  // var records = [
  // {"resuilt":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  // {"resuilt":0,"역할군":"암살자","챔피언":"탈론", "kda":"14/23/43"},{"resuilt":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  // {"resuilt":0,"역할군":"암살자","챔피언":"탈론", "kda":"14/23/43"},{"resuilt":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  // {"resuilt":0,"역할군":"암살자","챔피언":"탈론", "kda":"14/23/43"},{"resuilt":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  // {"resuilt":0,"역할군":"암살자","챔피언":"탈론", "kda":"14/23/43"},{"resuilt":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  // {"resuilt":0,"역할군":"암살자","챔피언":"탈론", "kda":"14/23/43"},{"resuilt":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  // {"resuilt":0,"역할군":"암살자","챔피언":"탈론", "kda":"14/23/43"},
  // ];

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(15),
            child: OutlinedButton(
              child: Text("전적갱신", style: TextStyle(fontSize: 25, color: Colors.black)),
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                padding: EdgeInsets.all(15),
                side: BorderSide(
                  color: Colors.black87,
                  width: 2.0,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              )
            ),
          ),
        ),
        SliverList.builder(
          itemCount: context.watch<CalendarStore>().records.length,
          itemBuilder: (c, i) {

            var data = context.watch<CalendarStore>().records[i];
            var lst = ['A', 'B', 'C', 'D', 'E','F','G','H','I','J','K','L','M','N','O','P','Q'];

            return Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 5.0),
              color: Color.fromRGBO(245, 245, 245, 1.0),
              child: ListTile(
                leading: Column(
                  children: [
                    data['result'] == "승리" ? Text("승", style: TextStyle(color: Colors.teal, fontSize: 20))
                        : Text("패", style: TextStyle(color: Colors.red, fontSize: 20)),
                    Text("${data['time']}"),
                  ],
                ),
                title: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: lst.contains(data['champion'][0]) ? NetworkImage('https://seongjun2moon.github.io/chanpionsA-Q/${data['champion']}.png')
                                  : NetworkImage('https://seongjun2moon.github.io/chanpionsR-Z/${data['champion']}.png'),
                              // backgroundColor: Colors.grey,
                              radius: 25,
                            ),
                            Text("${data['champion']}",textAlign: TextAlign.center),
                          ],
                        ),),
                      Expanded(
                        child: Text("${data['position']}",textAlign: TextAlign.center),
                      ),
                      Expanded(
                          child: Text("${data['kda']}",textAlign: TextAlign.center)
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: Text("분석",style: TextStyle(color: Colors.deepOrange)),
                          onPressed: (){
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (c) => analysis())
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ),
            );
          },
        )
      ],
    );
  }
}



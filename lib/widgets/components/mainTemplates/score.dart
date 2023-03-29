// 외부 라이브러리
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

//내부 위젯
import '../../../Providers/stores.dart';
import '../modules/score/analysis.dart';

class RecordWidget extends StatefulWidget {
  RecordWidget({Key? key, this.resetRegister, this.userRegister}) : super(key: key);

  final resetRegister;
  final userRegister;

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: (){
              widget.resetRegister();
            }
        ),
        title: Text("${widget.userRegister}",
            style: TextStyle(fontWeight: FontWeight.w600,
                color:Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
      ),
      body: CustomScrollView(
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
              var initial = ['A', 'B', 'C', 'D', 'E','F','G','H','I','J','K','L','M','N','O','P','Q'];

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
                                  backgroundImage: initial.contains(data['champion'][0]) ? NetworkImage('https://seongjun2moon.github.io/chanpionsA-Q/${data['champion']}.png')
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
                                // Navigator.push(context,
                                //     CupertinoPageRoute(builder: (c) => analysis())
                                // );
                                Get.to(analysis());
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
      ),
    );
  }
}



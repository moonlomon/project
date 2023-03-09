import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordWidget extends StatelessWidget {
  RecordWidget({Key? key}) : super(key: key);

  var records = [
  {"승패":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  {"승패":0,"역할군":"암살자","챔피언":"탈론", "kda":"3/1/4"},{"승패":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  {"승패":0,"역할군":"암살자","챔피언":"탈론", "kda":"3/1/4"},{"승패":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  {"승패":0,"역할군":"암살자","챔피언":"탈론", "kda":"3/1/4"},{"승패":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  {"승패":0,"역할군":"암살자","챔피언":"탈론", "kda":"3/1/4"},{"승패":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  {"승패":0,"역할군":"암살자","챔피언":"탈론", "kda":"3/1/4"},{"승패":1,"역할군":"탱커", "챔피언":"오른", "kda":"1/1/4"},
  {"승패":0,"역할군":"암살자","챔피언":"탈론", "kda":"3/1/4"},
  ];

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
          itemCount: records.length,
          itemBuilder: (c, i) {
            return Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(bottom: 5.0),
              color: Color.fromRGBO(245, 245, 245, 1.0),
              child: ListTile(
                leading: Column(
                  children: [
                    records[i]['승패'] == 0 ? Text("승", style: TextStyle(color: Colors.teal, fontSize: 20))
                        : Text("패", style: TextStyle(color: Colors.red, fontSize: 20)),
                    Text("00:00:00"),
                  ],
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/champion${i%2}.jpg'),
                          // backgroundColor: Colors.grey,
                          radius: 30,
                        ),
                        Text("${records[i]['챔피언']}"),
                      ],
                    ),),
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text("${records[i]['역할군']}"),
                    ),
                    Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: Text("${records[i]['kda']}")
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      child: Text("상세",style: TextStyle(color: Colors.deepOrange)),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c)=>details())
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class details extends StatelessWidget {
  const details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
      ),
      body: Text("hi"),
    );
  }
}

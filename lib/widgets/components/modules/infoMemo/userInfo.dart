import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/stores.dart';

class userInfoWidget extends StatefulWidget {
  const userInfoWidget({Key? key}) : super(key: key);

  @override
  State<userInfoWidget> createState() => _userInfoWidgetState();
}

class _userInfoWidgetState extends State<userInfoWidget> {
  @override
  Widget build(BuildContext context) {

    CalendarStore store = Provider.of<CalendarStore>(context, listen: false);

    return Container(
      color: Color.fromRGBO(30, 30, 30, 1.0),
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(store.selectUser.nickname??"소환사이름 없음",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600 ,color: Colors.white)),
                      Text(store.selectUser.level??"레벨정보 없음",
                          style: TextStyle(
                              color: Colors.white))
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundColor: context.watch<CalendarStore>().FRIMARY_COLOR,
                    child: IconButton(
                      icon: Icon(Icons.refresh, color: Colors.white),
                      onPressed: () {setState(() {});},
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundImage:
                              NetworkImage(store.selectUser.tier?? "https://opgg-static.akamaized.net/images/medals/default.png"),
                              backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
                          ),
                          Text("티어",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide.none,
                            bottom: BorderSide.none,
                            left: BorderSide(
                              color: Colors.white24,
                              width: 2,
                            ),
                            right:
                            BorderSide(color: Colors.white24, width: 2)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(store.selectUser.win_rate??"X",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.white54)),
                          Text("승률", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )),
                Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(store.selectUser.most??"https://opgg-static.akamaized.net/images/medals/default.png")),
                          Text("모스트챔피언",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
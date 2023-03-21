import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/stores.dart';

class userInfoWidget extends StatelessWidget {
  const userInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
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
                      Text("우엉이우어어엉",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white)),
                      Text("레벨",
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
                    child: Expanded(
                      child: IconButton(
                        icon: Icon(Icons.refresh, color: Colors.white),
                        onPressed: () {},
                      ),
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
                              backgroundImage: NetworkImage(
                                  'https://seongjun2moon.github.io/tier/gold.png'),
                              backgroundColor: Colors.black12,
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
                          Text("43%",
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
                              backgroundImage: NetworkImage(
                                  'https://seongjun2moon.github.io/chanpionsA-Q/Ahri.png')),
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
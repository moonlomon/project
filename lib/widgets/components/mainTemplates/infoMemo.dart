import 'package:flutter/material.dart';

import '../modules/infoMemo/memo.dart';
import '../modules/infoMemo/userInfo.dart';

class InfoMemoMain extends StatelessWidget {
  const InfoMemoMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 300,
            width: double.infinity,
            color: Colors.black87,
            child: Container(
              child: userInfoWidget(),
            )),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.white60,
            child: Container(
              child: MemoWidget(),
            ),
          ),
        )
      ],
    );
  }
}

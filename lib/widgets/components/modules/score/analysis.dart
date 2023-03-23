import 'package:flutter/material.dart';
import 'package:get/get.dart';

class analysis extends StatelessWidget {
  const analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: (){
              // Navigator.pop(context);
              Get.back();
            }
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (c, i) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Image.network('https://seongjun2moon.github.io/tier/test.gif'),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 600),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('우리팀 원딜 바텀에 혼자 있었음, 상대팀 미드와 상대팀 정글이 바텀에서 원딜 죽임\n'
                        '우리팀 탑이 탑에 있음, 상대팀 탑이 탑에 있음\n'
                        '상대 원딜이 미드에 있음, 상대 서폿은 보이지 않음 그치만 원딜 근처에 있을 확률 높음\n'
                        '그럼에도 원딜을 죽일려다 2대2 교전에서 사망'),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

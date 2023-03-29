import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/stores.dart';

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
                child: Image.network(Provider.of<CalendarStore>(context, listen: false).anlysis),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 600),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Provider.of<CalendarStore>(context, listen: false).explain),
                  ],
                ),
              ),
              SizedBox(child: IconButton(onPressed:(){} ,icon: Icon(Icons.play_arrow)),)
            ],
          );
        },
      ),
    );
  }
}

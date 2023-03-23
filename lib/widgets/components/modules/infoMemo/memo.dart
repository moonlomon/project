import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemoWidgetPage extends StatelessWidget {
  const MemoWidgetPage(
      {Key? key,
        required this.memoList,
        required this.title,
        required this.content,
        required this.colorNum})
      : super(key: key);

  final memoList;
  final title;
  final content;
  final colorNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
              child: GestureDetector(
                child: Stack(
                  children: [
                    Hero(
                      tag: "memohero",
                      child: memoWidget(
                        content: content,
                        colorNum: colorNum,
                      ),
                    ),
                    Positioned(
                        top: 100,
                        child: Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(title, style: TextStyle(fontSize: 24)),
                          ),
                        ))
                  ],
                ),
                onTap: () {
                  // Navigator.pop(context);
                  Get.back();
                },
              ),
            )));
  }
}

class memoWidget extends StatefulWidget {
  const memoWidget({Key? key, required this.content, required this.colorNum})
      : super(key: key);

  final content;
  final colorNum;

  @override
  State<memoWidget> createState() => _memoWidgetState();
}

class _memoWidgetState extends State<memoWidget> {
  color() {
    if (widget.colorNum % 3 == 0) {
      return Colors.teal;
    } else if (widget.colorNum % 3 == 1) {
      return Colors.orange;
    } else if (widget.colorNum % 3 == 2) {
      return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      color: color(),
      child: Center(
        child: Text(widget.content),
      ),
    );
  }
}
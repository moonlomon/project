// 외부 라이브러리
import 'package:flutter/material.dart';
import 'package:project/models/memoModels.dart';
import 'package:project/widgets/components/modules/infoMemo/todoList.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

//내부 라이브러리
import '../../../Providers/stores.dart';
import '../modules/infoMemo/memo.dart';
import '../modules/infoMemo/userInfo.dart';

class InfoMemoMain extends StatefulWidget {
  const InfoMemoMain({Key? key}) : super(key: key);

  @override
  State<InfoMemoMain> createState() => _InfoMemoMainState();
}

class _InfoMemoMainState extends State<InfoMemoMain> {
  late String title;
  late String content;
  late Color titleColor;

  var scroll = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleColor = Color.fromRGBO(30, 30, 30, 1.0);
    scroll.addListener((){
      setState(() {
        titleColor = scroll.position.pixels < 50 ? Color.fromRGBO(30, 30, 30, 1.0) : Colors.white;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    var memoList = context.watch<CalendarStore>().memos;
    CalendarStore store = Provider.of<CalendarStore>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: const Text("메모장"),
                  actions: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          title = value;
                        });
                      },
                      decoration: InputDecoration(hintText: "제목"),
                    ),
                    TextField(
                        onChanged: (value) {
                          setState(() {
                            content = value;
                          });
                        },
                        decoration: InputDecoration(hintText: "내용")),
                    Center(
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context).pop();
                                Get.back();
                                setState(() {
                                  memoList.add({'title':title, 'content':content});
                                });
                              },
                              child: Text("추가"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context).pop();
                                Get.back();
                              },
                              child: Text("취소"),
                            ),
                          ],
                        )
                    ),
                  ],
                );
              });
        },
        backgroundColor: context.watch<CalendarStore>().SUB_COLOR,
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: (){
              Get.back();
            }
        ),
        title: Text(
            store.selectUser.nickname??"소환사이름 없음",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color:titleColor
            )),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
        elevation: 0,
      ),
      body: CustomScrollView(
        controller: scroll,
        slivers: [
          SliverToBoxAdapter(
            child: userInfoWidget(),
          ),
          SliverToBoxAdapter(
            child: TodoWidget(),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (c, i) => Card(
                child: Container(
                  child: GestureDetector(
                    child: GridTile(
                      child: Hero(
                        tag: "memohero",
                        child: memoWidget(
                            content: memoList[i]['content'], colorNum: i),
                      ),
                    ),
                    onTap: () {
                      Get.to(MemoWidgetPage(
                                memoList: memoList,
                                title: memoList[i]['title'],
                                content: memoList[i]['content'],
                                colorNum: i));
                    },
                  ),
                ),
              ),
              childCount: memoList.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          )
        ],
      ),
    );
  }
}



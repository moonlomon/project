// 외부 라이브러리
import 'package:flutter/material.dart';
import 'package:project/models/memoModels.dart';
import 'package:project/widgets/components/modules/infoMemo/todoList.dart';
import 'package:provider/provider.dart';

//내부 라이브러리
import '../../../Providers/stores.dart';
import '../modules/infoMemo/memo.dart';
import '../modules/infoMemo/userInfo.dart';

class InfoMemoMain extends StatefulWidget {
  const InfoMemoMain({Key? key,}) : super(key: key);


  @override
  State<InfoMemoMain> createState() => _InfoMemoMainState();
}

class _InfoMemoMainState extends State<InfoMemoMain> {
    late String title;
    late String content;

  @override
  Widget build(BuildContext context) {
    var memoList = context.watch<CalendarStore>().memos;
    var scroll = ScrollController();

    @override
    void initState() {
      super.initState();
      scroll.addListener((){
        print(scroll.position.pixels);
      });
    }

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
                                Navigator.of(context).pop();
                                setState(() {
                                  memoList.add({'title':title, 'content':content});
                                });
                              },
                              child: Text("추가"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MemoWidgetPage(
                            memoList: memoList,
                            title: memoList[i]['title'],
                            content: memoList[i]['content'],
                            colorNum: i);
                      }));
                    },
                  ),
                ),
              ),
              childCount: memoList.length,
            ),
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          )
        ],
      ),
    );
  }
}



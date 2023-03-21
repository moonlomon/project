import 'package:flutter/material.dart';

import '../../../database/cloudfirebase.dart';

class OurApp extends StatelessWidget {
  const OurApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return test();
  }
}

class TodoModel {
  final String title;
  final String description;

  TodoModel({required this.title, required this.description});
}

class test extends StatefulWidget {
  const test({Key? key, this.resetNum}) : super(key: key);

  final resetNum;

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  String title="";
  String description = "";
  List<TodoModel> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(// 높이를 100으로 고정
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(borderRadius:
                          BorderRadius.circular(8)
                          ),
                          child: ListTile(
                            title: Text(todos[index].title),
                            subtitle: Text(todos[index].description),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  todos.removeAt(index);
                                });
                              },
                            ),
                          ),
                        )
                    );
                  },
                )
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.add_circle)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal,
            // 클릭했을 때 실행할 함수
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text('할 일'),
                      actions: [
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              title = value;
                            });
                          },
                          decoration: InputDecoration(hintText: "todo 제목"),
                        ),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              description = value;
                            });
                          },
                          decoration: InputDecoration(hintText: "todo 내용"),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                print(todos);
                                todos.add(TodoModel(
                                    title: title,
                                    description: description
                                ));
                                print(todos);
                              });
                            },
                            child: Text("todo 추가"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              );
            },
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            )
        )
    );
  }
}

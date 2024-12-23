import 'package:flutter/material.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo アプリケーション',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyToDo(title: 'ToDo アプリケーション'),
    );
  }
}

class MyToDoItem {
  final String title;
  final String detail;
  bool done;

  MyToDoItem({required this.title, required this.detail, required this.done});
}

class MyToDo extends StatefulWidget {
  const MyToDo({super.key, required this.title});

  final String title;

  @override
  State<MyToDo> createState() => _MyToDoState();
}

class _MyToDoState extends State<MyToDo> {
  final String title = 'potekichi';
  final List<MyToDoItem> toDoList = [
    MyToDoItem(title: 'タイトル1', detail: '詳細1', done: false),
    MyToDoItem(title: 'タイトル2', detail: '詳細2', done: false),
    MyToDoItem(title: 'タイトル3', detail: '詳細3', done: false),
    MyToDoItem(title: 'タイトル4', detail: '詳細4', done: false),
    MyToDoItem(title: 'タイトル5', detail: '詳細5', done: false),
    MyToDoItem(title: 'タイトル6', detail: '詳細6', done: false),
    MyToDoItem(title: 'タイトル7', detail: '詳細7', done: false),
  ];
  final ScrollController _topScrollController = ScrollController();
  final ScrollController _bottomScrollController = ScrollController();

  void updateItemStatus(int index, bool newValue) {
    setState(() {
      // 状態を更新
      toDoList[index].done = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            const Text("未完了"),
            Flexible(
                flex: 1,
                child: Scrollbar(
                  controller: _topScrollController,
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: toDoList
                        .where((element) => !element.done)
                        .toList()
                        .length,
                    itemBuilder: (context, index) {
                      final uncompletedList =
                          toDoList.where((element) => !element.done).toList();
                      return ToDoItemCard(
                        item: uncompletedList[index],
                        onChanged: (newValue) {
                          updateItemStatus(index, newValue!);
                        },
                      );
                    },
                  ),
                )),
            const Text("完了済み"),
            // 完了済みのリストを表示
            Flexible(
                flex: 1,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _bottomScrollController,
                  child: ListView.builder(
                    itemCount: toDoList
                        .where((element) => element.done)
                        .toList()
                        .length,
                    itemBuilder: (context, index) {
                      final completedList =
                          toDoList.where((element) => element.done).toList();
                      return ToDoItemCard(
                        item: completedList[index],
                        onChanged: (newValue) {
                          updateItemStatus(index, newValue!);
                        },
                      );
                    },
                  ),
                )),
          ],
        ));
  }
}

class ToDoItemCard extends StatelessWidget {
  const ToDoItemCard({
    super.key,
    required this.item,
    required this.onChanged,
  });

  final MyToDoItem item;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(item.title),
              Text(item.detail),
            ],
          ),
          Checkbox(
            value: item.done,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

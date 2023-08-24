import 'package:flutter/material.dart';

class Task {
  String title;
  bool isCompleted;
  Task(
    this.isCompleted,
    this.title,
  );
}

class Todolisttask extends StatefulWidget {
  const Todolisttask({super.key});

  @override
  State<Todolisttask> createState() => _TodolisttaskState();
}

class _TodolisttaskState extends State<Todolisttask> {
  List<Task> tasks = [];
  final bool isloading = false;
  final GlobalKey<AnimatedListState> animatedlistkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedList(
          key: animatedlistkey,
          initialItemCount: tasks.length,
          itemBuilder: ((context, index, animation) {
            return buildtaskitem(tasks[index], animation, index);
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: addtask(),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildtaskitem(Task task, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Text(task.title),
          onLongPress: removetask(index),
        ),
      ),
    );
  }

  removetask(int index) async {}

  addtask() {}
}

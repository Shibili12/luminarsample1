import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('to_do_Box');
  runApp(MaterialApp(
    home: Hive_crud(),
  ));
}

class Hive_crud extends StatefulWidget {
  const Hive_crud({super.key});

  @override
  State<Hive_crud> createState() => _Hive_crudState();
}

class _Hive_crudState extends State<Hive_crud> {
  List<Map<String, dynamic>> task = [];
  final taskcontroller = TextEditingController();
  final contentcontroller = TextEditingController();
  final mybox = Hive.box('to_do_Box');

  @override
  void initState() {
    loadTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "TODO",
          style: TextStyle(color: Colors.green[900]),
        ),
      ),
      body: task.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: task.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: ListTile(
                    title: Text(task[index]['taskname']),
                    subtitle: Text(task[index]['taskcontent']),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showTask(context, null),
        label: const Text("add task"),
        icon: const Icon(Icons.add),
      ),
    );
  }

  showTask(BuildContext context, int? itemkey) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: taskcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Task name",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: contentcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Task content",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (taskcontroller.text != "" &&
                      contentcontroller.text != "") {
                    if (itemkey == null) {
                      createTask({
                        'name': taskcontroller.text.trim(),
                        'content': contentcontroller.text.trim(),
                      });
                    } else {
                      updateTask(itemkey, {
                        'name': taskcontroller.text.trim(),
                        'content': contentcontroller.text.trim(),
                      });
                    }
                  }
                  taskcontroller.text = "";
                  contentcontroller.text = "";
                  Navigator.pop(context);
                },
                child: Text(itemkey == null ? "create" : "update"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> createTask(Map<String, dynamic> task) async {
    await mybox.add(task);
    loadTask();
  }

  void updateTask(int? itemkey, Map<String, dynamic> task) {}

  //to read datas from hive
  void loadTask() {
    final task_from_hive = mybox.keys.map((key) {
      final value = mybox.get(key);

      return {
        'id': key,
        'taskname': value['name'],
        'taskcontent': value['content'],
      };
    }).toList();
    setState(() {
      task = task_from_hive.reversed.toList();
    });
  }
}

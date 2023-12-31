import 'package:flutter/material.dart';
import 'package:luminarsample1/storage/sqflite_crud/loginregistration/sqlhelper.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    refresh();
    // TODO: implement initState
    super.initState();
  }

  void refresh() async {
    var mydta = await Sqlhelper2.getAll();
    setState(() {
      data = mydta;
    });
  }

  void delete(int id) async {
    await Sqlhelper2.deleteuser(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: ((context, index) => Card(
                child: ListTile(
                  title: Text('${data[index]['name']}'),
                  subtitle: Text('${data[index]['uname']}'),
                  trailing: IconButton(
                    onPressed: () {
                      delete(data[index]['id']);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

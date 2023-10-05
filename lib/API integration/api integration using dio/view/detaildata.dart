import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luminarsample1/API%20integration/api%20integration%20using%20dio/controller/datacontroller.dart';

class Detaildata extends StatelessWidget {
  int index;
  Detaildata({required this.index});
  DataController dataController = Get.find<DataController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dataController.datas[index].id.toString()),
            Text(
              dataController.datas[index].title!,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(dataController.datas[index].body!),
          ],
        ),
      ),
    );
  }
}

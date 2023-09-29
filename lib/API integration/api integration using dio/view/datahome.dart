import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:luminarsample1/API%20integration/api%20integration%20using%20dio/controller/datacontroller.dart';
import 'package:luminarsample1/API%20integration/api%20integration%20using%20dio/view/detaildata.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(GetMaterialApp(
    home: Datahome(),
  ));
}

class Datahome extends StatelessWidget {
  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("data home"),
      ),
      body: Obx(() => SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: dataController.isNetConnected.value
                ? (dataController.isLoading.value ? loadAnimation() : getData())
                : noInternet(context),
          )),
      floatingActionButton: Obx(
          () => dataController.isNetConnected.value ? buildFAB() : Container()),
    );
  }

  loadAnimation() {
    return Center(
      child: SizedBox(
        height: 150,
        width: 150,
        child: Lottie.asset("assets/animation/loading.json"),
      ),
    );
  }

  RefreshIndicator getData() {
    return RefreshIndicator(
      child: ScrollablePositionedList.builder(
        itemScrollController: dataController.itemcontroller,
        physics: const BouncingScrollPhysics(),
        itemCount: dataController.datas.length,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () => Get.to(Detaildata(index: index)),
            child: Card(
              child: ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(dataController.datas[index].id.toString()),
                  ),
                ),
                title: Text(
                  dataController.datas[index].title!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  dataController.datas[index].body!,
                  maxLines: 2,
                ),
              ),
            ),
          );
        }),
      ),
      onRefresh: () {
        return dataController.fetchData();
      },
    );
  }

  noInternet(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Lottie.asset("assets/animation/nointernet.json"),
          ),
          MaterialButton(
            color: Colors.green[900],
            onPressed: () async {
              if (await InternetConnectionChecker().hasConnection == true) {
                dataController.fetchData();
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("No internet")));
              }
            },
          ),
        ],
      ),
    );
  }

  FloatingActionButton buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        dataController.isListatdown.value
            ? dataController.scrolltoUp()
            : dataController.scrolltoDown();
      },
      backgroundColor: Colors.green[900],
      child: Icon(dataController.isListatdown.value
          ? Icons.arrow_upward
          : Icons.arrow_downward),
    );
  }
}

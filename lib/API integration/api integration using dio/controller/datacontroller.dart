import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:luminarsample1/API%20integration/api%20integration%20using%20dio/model/postmodel.dart';
import 'package:luminarsample1/API%20integration/api%20integration%20using%20dio/services/dioservice.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DataController extends GetxController {
  RxList<Post> datas = RxList(); //this list is observable
  RxBool isLoading = true.obs; //to check whether the data is loaded or not
  RxBool isListatdown = false.obs; //to check whether the list is in down
  RxBool isNetConnected = true.obs; //check whether the network is available

  var itemcontroller =
      ItemScrollController(); //to monitor the position of the list
  var url = "https://jsonplaceholder.typicode.com/posts";
  //is network is connected or not
  isInternetConnected() async {
    isNetConnected.value = await InternetConnectionChecker().hasConnection;
  }

  //to get all datas from api
  fetchData() async {
    isInternetConnected();
    isLoading.value = true;
    var response = await DioService().getData(url);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        datas.add(Post.fromJson(element));
      });
      isLoading.value = false;
    } else {}
  }
  //scroll listview to down

  scrolltoDown() {
    itemcontroller.scrollTo(
        index: datas.length - 5,
        duration: Duration(seconds: 2),
        curve: Curves.bounceIn);
    isListatdown.value = true;
  }

  scrolltoUp() {
    itemcontroller.scrollTo(
        index: 0, duration: Duration(seconds: 2), curve: Curves.bounceOut);
    isListatdown.value = false;
  }

  @override
  void onInit() {
    fetchData();
    isInternetConnected();
    super.onInit();
  }
}

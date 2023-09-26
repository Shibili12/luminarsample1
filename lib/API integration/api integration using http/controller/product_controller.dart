import 'package:get/get.dart';
import 'package:luminarsample1/API%20integration/api%20integration%20using%20http/service/apiservice.dart';

class Productcontroller extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;
  @override
  void onInit() {
    getproduct();
    super.onInit();
  }

  void getproduct() async {
    try {
      isLoading(true);
      var products = await Httpservice.fetchproduct();
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

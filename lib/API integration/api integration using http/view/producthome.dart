import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:luminarsample1/API%20integration/api%20integration%20using%20http/controller/product_controller.dart';
import 'package:luminarsample1/API%20integration/api%20integration%20using%20http/view/widgets/productTile.dart';

void main() {
  runApp(MaterialApp(
    home: Producthome(),
  ));
}

class Producthome extends StatelessWidget {
  final Productcontroller productcontroller = Get.put(Productcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Obx(() {
          if (productcontroller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              itemCount: productcontroller.productList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Producttile(productcontroller.productList[index]);
              },
            );
          }
        }),
      ),
    );
  }
}

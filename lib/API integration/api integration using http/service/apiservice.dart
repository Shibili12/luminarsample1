import 'package:luminarsample1/API%20integration/api%20integration%20using%20http/model/product_model.dart';
import 'package:http/http.dart' as http;

class Httpservice {
  static Future<List<Productmodel>> fetchproduct() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var data = response.body;
      return productmodelFromJson(data);
    } else {
      throw Exception();
    }
  }
}

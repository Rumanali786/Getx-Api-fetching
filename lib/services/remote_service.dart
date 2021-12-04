import 'package:http/http.dart' as http;
import 'package:getx_project/model/products.dart';
class RemoteServices {
  static var client = http.Client();

  static Future<List<Products>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return productFromJson("");
    }
  }
}
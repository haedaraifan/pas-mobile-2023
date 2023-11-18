import 'package:http/http.dart' as http;
import 'package:pas_mobile_2023/common/models/coffee_response_model.dart';

class ProductService {
  static const baseUrl = "https://fake-coffee-api.vercel.app/api";

  static Future getAll() async {
    try {

      final response = await http.get(
        Uri.parse(baseUrl)
      );

      if(response.statusCode == 200) {
        return productResponseModelFromJson(response.body);
      } else {
        print("status code: ${response.statusCode}");
      }

    } catch(e) {
      print("error : $e");
    }
  }

  static Future getById(String id) async {
    try {

      final response = await http.get(
        Uri.parse("$baseUrl/$id")
      );

      if(response.statusCode == 200) {
        List<ProductResponseModel> parsedResponse = productResponseModelFromJson(response.body);
        return parsedResponse[0];
      } else {
        print("status code: ${response.statusCode}");
      }

    } catch(e) {
      print("error : $e");
    }
  }
}
import 'package:http/http.dart' as http;
import 'package:pas_mobile_2023/common/models/register_response_model.dart';
import 'package:pas_mobile_2023/common/models/login_response_model.dart';

class UserService {
  static const baseUrl = "https://mediadwi.com/api/latihan";

  static Future login(String username, String password) async {
    try {

      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "username": username,
          "password": password
        }
      );

      if(response.statusCode == 200) return loginResponseModelFromJson(response.body);

    } catch(e) {
      print("error : $e");
    }
  }

  static Future register(String username, String email, String password) async {
    try {
      
      final response = await http.post(
        Uri.parse("$baseUrl/register-user"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          "username": username,
          "full_name": username,
          "email": email,
          "password": password
        }
      );

      if(response.statusCode == 200) return registerResponseModelFromJson(response.body);
      
    } catch(e) {
      print("error : $e");
    }
  }
}
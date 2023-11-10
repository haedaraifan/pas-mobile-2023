import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_2023/common/routes/route_name.dart';
import 'package:pas_mobile_2023/common/widget/toast_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/models/login_response_model.dart';

class LoginController extends GetxController {
  late final SharedPreferences prefs;
  RxBool isLoading = false.obs;
  RxString message = "".obs;

  @override
  void onInit() {
    super.onInit();
    setPreference();
  }

  void loginAction(String username, String password) async {
    try {

      isLoading.value = true;
      if(username.isEmpty || password.isEmpty) {
        message.value = "Fields cannot be empty";

        isLoading.value = false;
        ToastMessage.show(message.value);
        return;
      }

      final url = Uri.parse("https://mediadwi.com/api/latihan/login");
      final headers = {
        "Content-Type": "application/x-www-form-urlencoded",
      };
      final body = {
        "username": username,
        "password": password
      };

      final response = await http.post(
        url,
        headers: headers,
        body: body
      );

      if(response.statusCode == 200) {
        final responseData = loginResponseModelFromJson(response.body);
        message.value = responseData.message;

        isLoading.value = false;
        ToastMessage.show(message.value);
        if(responseData.status) {
          await prefs.setBool("isLogin", true);
          await prefs.setString("userToken", responseData.token);

          Get.offAllNamed(RouteName.home);
        }
      } else {
        print("status code: ${response.statusCode}");
      }

    } catch(e) {
      print(e);
    }
  }

  setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }
}
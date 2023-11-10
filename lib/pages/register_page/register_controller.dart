import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_2023/common/models/register_response_model.dart';
import '../../common/routes/route_name.dart';
import '../../common/widget/toast_message.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxString message = "".obs;

  void registerAction(
    String username,
    String email,
    String password,
    String confirmPassword
  ) async {
    try {

      isLoading.value  = true;
      if(username.isEmpty ||  email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        message.value = "Fields cannot be empty";

        isLoading.value = false;
        ToastMessage.show(message.value);
        return;
      }
      if(password != confirmPassword) {
        message.value = "Password and confirmation password do not match";

        isLoading.value = false;
        ToastMessage.show(message.value);
        return;
      }

      final url = Uri.parse("https://mediadwi.com/api/latihan/register-user");
      final headers = {
        "Content-Type": "application/x-www-form-urlencoded",
      };
      final body = {
        "username": username,
        "full_name": username,
        "email": email,
        "password": password
      };

      final response = await http.post(
        url,
        headers: headers,
        body: body
      );

      if(response.statusCode == 200) {
        final responseData = registerResponseModelFromJson(response.body);
        message.value = responseData.message;

        isLoading.value = false;
        ToastMessage.show(message.value);
        if(responseData.status) Get.off(RouteName.login);
      } else {
        print("status code: ${response.statusCode}");
      }

    } catch(e) {
      print(e);
    }
  }
}
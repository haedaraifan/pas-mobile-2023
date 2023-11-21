import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/routes/route_name.dart';
import 'package:pas_mobile_2023/common/services/user_service.dart';
import 'package:pas_mobile_2023/common/widget/toast_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late final SharedPreferences prefs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    setPreference();
  }

  void loginAction(String username, String password) async {
    isLoading.value = true;

    if(username.isEmpty || password.isEmpty) {
      isLoading.value = false;
      ToastMessage.show("Fields cannot be empty");
      return;
    }

    final responseData = await UserService.login(username, password);
    isLoading.value = false;
    ToastMessage.show(responseData.message);

    if(responseData.status) {
      await prefs.setBool("isLogin", true);
      await prefs.setString("userToken", responseData.token);
      await prefs.setString("username", username);
      Get.offAllNamed(RouteName.home);
    }
  }

  setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }
}
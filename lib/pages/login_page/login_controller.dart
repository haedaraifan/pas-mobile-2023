import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late final SharedPreferences prefs;
  RxBool isLogin = false.obs;

  loginAction(String username, String password) async {
    prefs = await SharedPreferences.getInstance();
    if(username == "admin" && password == "admin") {
      isLogin.value = true;
      await prefs.setBool('isLogin', isLogin.value);
      Get.offNamed(RouteName.home);
    }
  }
}
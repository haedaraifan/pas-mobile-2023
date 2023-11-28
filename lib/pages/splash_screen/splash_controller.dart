import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/models/user_profile_response_model.dart';
import 'package:pas_mobile_2023/common/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/routes/route_name.dart';

class SplashController extends GetxController {
  late final SharedPreferences prefs;
  final int splashDuration = 3;

  @override
  void onInit() {
    super.onInit();
    checkSessionLogin();
  }

  void checkSessionLogin() async {
    prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: splashDuration), () async {
      if(prefs.getString("loginType") == "google") {
        Get.offAllNamed(RouteName.home);
        return;
      }
      
      String userToken = prefs.getString("userToken") ?? "asd";
      final responseData = await UserService.getProfile(userToken) ?? UserProfileResponseModel(
        status: false,
        message: ""
      );

      responseData.status
      ? Get.offAllNamed(RouteName.home)
      : Get.offAllNamed(RouteName.getStarted);
    });
  }
}
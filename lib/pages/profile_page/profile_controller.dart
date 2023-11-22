import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/models/user_profile_response_model.dart';
import 'package:pas_mobile_2023/common/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{
  late final SharedPreferences prefs;
  RxBool isLoading = false.obs;
  Rx<UserData> userData = UserData(
    username: "username",
    fullName: "fullName",
    email: "email@gmail.com"
  ).obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  getProfile() async {
    isLoading.value = true;
    prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("userToken");
    UserProfileResponseModel responseData = await UserService.getProfile(token!);

    if(responseData.status) userData.value = responseData.data;
    isLoading.value = false;
  }

  signout() async {
    prefs.clear();
    Get.offAllNamed("/login");
  }
}
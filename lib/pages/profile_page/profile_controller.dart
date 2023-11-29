import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/models/user_profile_response_model.dart';
import 'package:pas_mobile_2023/common/services/user_service.dart';
import 'package:pas_mobile_2023/common/widget/toast_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{
  late SharedPreferences prefs;
  RxBool isLoading = false.obs;
  RxString userPhotoUrl = "".obs;
  Rx<UserData> userData = UserData(
    username: "",
    fullName: "",
    email: ""
  ).obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      getProfile();
    });
  }

  getProfile() async {
    isLoading.value = true;
    prefs = await SharedPreferences.getInstance();

    if(prefs.getString("loginType") == "google") {
      userData.value = UserData(
        username: prefs.getString("userDisplayName")!,
        fullName: prefs.getString("userDisplayName")!,
        email: prefs.getString("userEmail")!
      );
      userPhotoUrl.value = prefs.getString("userPhotoUrl")!;

      isLoading.value = false;
      return;
    }

    String? token = prefs.getString("userToken");
    UserProfileResponseModel responseData = await UserService.getProfile(token!);

    if(responseData.status) userData.value = responseData.data;
    isLoading.value = false;
  }

  signout() {
    if(isLoading.value == false) {
      ToastMessage.show("sign out ...");
      prefs.clear();
      Get.offAllNamed("/login");
    }
    return null;
  }
}
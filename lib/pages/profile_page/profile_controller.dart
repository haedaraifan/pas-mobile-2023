import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{
  late final SharedPreferences prefs;
  RxString username = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString("username") ?? "No Username";
  }

  signout() async {
    prefs.clear();
    Get.offAllNamed("/login");
  }

}
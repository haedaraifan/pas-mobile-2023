import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pas_mobile_2023/common/routes/route_name.dart';
import 'package:pas_mobile_2023/common/services/user_service.dart';
import 'package:pas_mobile_2023/common/widget/toast_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late final SharedPreferences prefs;
  RxBool isLoading = false.obs;

  GoogleSignInAccount? currentUser;
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void onInit() {
    super.onInit();
    setPreference();

    googleSignIn.onCurrentUserChanged.listen((account) {
      currentUser = account;
    });
    googleSignIn.signOut();
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
      await prefs.setString("userToken", responseData.token);
      Get.offAllNamed(RouteName.home);
    }
  }

  void handleGoogleSignIn() async {
    try {
      await googleSignIn.signIn();
      await googleSignIn.signIn();

      ToastMessage.show("Login success");
      setGoogleSignInPreferences();
      Get.offAllNamed(RouteName.home);
    } catch (error) {
      print(error);
    }
  }

  void setGoogleSignInPreferences() async {
    await prefs.setString("loginType", "google");
    await prefs.setString("userPhotoUrl", currentUser!.photoUrl ?? "");
    await prefs.setString("userEmail", currentUser!.email ?? "");
    await prefs.setString("userDisplayName", currentUser!.displayName ?? "");
  }

  void logOut() {
    ToastMessage.show("Logout");
    googleSignIn.signOut();
  }

  setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }
}
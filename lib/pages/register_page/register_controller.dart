import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/services/user_service.dart';
import 'package:pas_mobile_2023/common/routes/route_name.dart';
import 'package:pas_mobile_2023/common/widget/toast_message.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;

  void registerAction(
    String username,
    String email,
    String password,
    String confirmPassword
  ) async {
    isLoading.value  = true;

    if(username.isEmpty ||  email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      isLoading.value = false;
      ToastMessage.show("Fields cannot be empty");
      return;
    }
    if(password != confirmPassword) {
      isLoading.value = false;
      ToastMessage.show("Password and confirmation password do not match");
      return;
    }

    final responseData = await UserService.register(username, email, password);
    isLoading.value = false;
    ToastMessage.show(responseData.message);

    if(responseData.status) Get.offNamed(RouteName.login);
  }
}
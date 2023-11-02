import 'package:get/get.dart';

class ExampleController extends GetxController {
  RxString appBarTitle = "".obs;
  RxString content = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    appBarTitle.value = "Ini App Bar";
    content.value = "Hello World!";
  }
}
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_2023/common/models/coffee_response_model.dart';

class HomeController extends GetxController {
  RxList<ProductResponseModel> coffeResponseModel = <ProductResponseModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    try {

      final url = Uri.parse("https://fake-coffee-api.vercel.app/api");

      final response = await http.get(url);

      if(response.statusCode == 200) {
        coffeResponseModel.value = productResponseModelFromJson(response.body);
      } else {
        print("status code: ${response.statusCode}");
      }

      isLoading.value = false;

    } catch(e) {
      print("error : $e");
    }
  }

  List<ProductResponseModel> getDiscountProduts(int limit) {
    List<ProductResponseModel> sortedProduct = List.from(coffeResponseModel);
    sortedProduct.sort((a, b) => a.price.compareTo(b.price));
    return sortedProduct.take(limit).toList();
  }
}
import 'package:get/get.dart';
import 'package:pas_mobile_2023/common/models/coffee_response_model.dart';
import 'package:pas_mobile_2023/common/services/product_service.dart';


class HomeController extends GetxController {
  RxList<ProductResponseModel> coffeResponseModel = <ProductResponseModel>[].obs;
  RxBool isLoading = true.obs;
  RxInt selectedRoastLevel = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    coffeResponseModel.value = await ProductService.getAll();
    isLoading.value = false;
  }

  List<ProductResponseModel> getDiscountProduts(int limit) {
    List<ProductResponseModel> sortedProduct = List.from(coffeResponseModel);
    sortedProduct.sort((a, b) => a.price.compareTo(b.price));
    return sortedProduct.take(limit).toList();
  }

  selectRoastLevel(int newIndex) => selectedRoastLevel.value = newIndex;

  List<ProductResponseModel> sortProductByRoastLevel(List<ProductResponseModel> productList, int roastLevel) {
    if (roastLevel == 0) return productList;
    return productList.where((product) => product.roastLevel == roastLevel).toList();
  }
}
import 'package:get/state_manager.dart';
import 'package:the_line/models/product.dart';
import 'package:the_line/models/repository/api_repository.dart';

import 'package:the_line/screens/products/product.dart';
import 'package:the_line/screens/products/remotServer.dart';
import 'package:the_line/screens/products/remotServer.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}

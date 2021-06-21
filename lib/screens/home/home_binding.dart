import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:the_line/screens/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        localRepositoryInterface: Get.find(),
        apiRepostoryInterface: Get.find(),
      ),
    );
  }
}

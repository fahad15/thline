import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:the_line/screens/splash/splash_controller.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(
        apiRepostoryInterface: Get.find(),
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}

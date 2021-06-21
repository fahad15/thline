import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:the_line/screens/login/login_controller.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        apiRepostoryInterface: Get.find(),
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}

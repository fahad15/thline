import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:the_line/screens/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}

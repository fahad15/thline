import 'package:get/get.dart';
import 'package:the_line/models/repository/api_repository.dart';
import 'package:the_line/models/repository/local_storage_repository.dart';
import 'package:the_line/models/theme.dart';
import 'package:the_line/routes/ruotenavigationpage.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepostoryInterface apiRepostoryInterface;

  SplashController({this.localRepositoryInterface, this.apiRepostoryInterface});

  @override
  void onInit() {
    validataTheme();
    super.onInit();
  }

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validataTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode();
    if (isDark != null) {
      Get.changeTheme(isDark ? darkTheme : lightTheme);
    } else {
      Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
    }
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepostoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(PageRuotes.home);
    } else {
      Get.offNamed(PageRuotes.login);
    }
  }
}

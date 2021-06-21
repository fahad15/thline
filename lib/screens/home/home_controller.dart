import 'package:get/state_manager.dart';
import 'package:the_line/models/repository/api_repository.dart';
import 'package:the_line/models/repository/local_storage_repository.dart';
import 'package:the_line/models/user.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepostoryInterface apiRepostoryInterface;

  HomeController({this.localRepositoryInterface, this.apiRepostoryInterface});

  Rx<User> user = User.empty().obs;
  RxInt indexSelected = 0.obs;
  RxBool darkTheme = false.obs;

  @override
  void onInit() {
    loadCuttentTheme();
    super.onInit();
  }

  @override
  void onReady() {
    loadUser();
    loadCuttentTheme();
    super.onReady();
  }

  void loadUser() {
    localRepositoryInterface.getUser().then(
      (value) {
        user(value);
      },
    );
  }

  void loadCuttentTheme() {
    localRepositoryInterface.isDarkMode().then(
      (value) {
        darkTheme(value);
      },
    );
  }

  bool updateTheme(bool isDark) {
    localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;
  }

  void updateIndexSelected(int index) {
    indexSelected(index);
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepostoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }
}

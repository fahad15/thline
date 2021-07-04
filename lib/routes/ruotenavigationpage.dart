import 'package:get/route_manager.dart';
import 'package:the_line/presentation/main_binding.dart';
import 'package:the_line/screens/home/home_binding.dart';
import 'package:the_line/screens/home/home_screen.dart';
import 'package:the_line/screens/login/login_binding.dart';
import 'package:the_line/screens/login/login_screen.dart';
import 'package:the_line/screens/splash/splash_binding.dart';
import 'package:the_line/screens/splash/splash_screen.dart';

class PageRuotes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';
}

// login تبديل البروفايل الى
class RuoteNavigationPage {
  static final pages = [
    GetPage(
      //تبديل البروفايل الى splash
      name: PageRuotes.splash,
      page: () => SplashScreen(),
      bindings: [MainBinding(), SplashBinding()],
    ),
    GetPage(
      name: PageRuotes.login,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: PageRuotes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}

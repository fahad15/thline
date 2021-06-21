import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:the_line/models/theme.dart';
import 'package:the_line/presentation/main_binding.dart';
import 'package:the_line/routes/ruotenavigationpage.dart';

class MainThemingAndStateManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: PageRuotes.splash,
      getPages: RuoteNavigationPage.pages,
      initialBinding: MainBinding(),
    );
  }
}

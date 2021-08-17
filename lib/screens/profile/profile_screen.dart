import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_line/models/theme.dart';
import 'package:the_line/routes/ruotenavigationpage.dart';
import 'package:the_line/screens/home/home_controller.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();

  Future<void> logout() async {
    await controller.logOut();
    Get.offAllNamed(PageRuotes.splash);
  }

  void onThemeUpdated(bool isDark) {
    controller.updateTheme(isDark);
    Get.changeTheme(isDark ? darkTheme : lightTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final user = controller.user.value;
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          body: user.image != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).accentColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                radius: 50,
                                // backgroundImage: AssetImage(user.image),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Text(
                              user.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                //color: DelivryColor.green),
                                //Theme.of(context).accentColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Card(
                              color: Theme.of(context).canvasColor,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'prsonal',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        //color: Theme.of(context).accentColor),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      user.username,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Dark Mode',
                                        ),
                                        Spacer(),
                                        Obx(
                                          () => Switch(
                                            value: controller.darkTheme.value,
                                            onChanged: onThemeUpdated,
                                            activeColor: DelivryColor.purple,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Center(
                            child: RaisedButton(
                              color: Theme.of(context).accentColor,
                              onPressed: logout,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                    color: DelivryColor.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}

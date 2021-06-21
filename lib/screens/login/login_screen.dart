import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_line/models/theme.dart';
import 'package:the_line/routes/ruotenavigationpage.dart';

import 'package:the_line/screens/login/login_controller.dart';
import 'package:the_line/wighit/delivery_button.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

const logoSize = 45.0;

class LoginScreen extends GetWidget<LoginController> {
  void login() async {
    final result = await controller.login();
    if (result) {
      Get.offAllNamed(PageRuotes.home);
    } else {
      Get.snackbar('Error', 'Login incorrect');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moresize = 50.0;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: logoSize,
                      left: -moresize / 2,
                      right: -moresize / 2,
                      height: width + moresize,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.5, 1.0],
                            colors: deliveryGradients, //
                          ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(200),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).canvasColor,
                        radius: logoSize,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/logo.jpg',
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Username',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .inputDecorationTheme
                                    .labelStyle
                                    .color,
                              ),
                        ),
                        TextField(
                          controller: controller.usernameTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            hintText: 'username',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'password',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .inputDecorationTheme
                                    .labelStyle
                                    .color,
                              ),
                        ),
                        TextField(
                          controller: controller.passwordTextController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            hintText: 'password',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: DeliveryButton(
                  text: 'login',
                  onTap: login,
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Obx(() {
              if (controller.loginState.value == LoginState.loading) {
                return Container(
                  color: Colors.black26,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:the_line/models/theme.dart';
import 'package:the_line/screens/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends GetWidget<SplashController> {
  final splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(
                'assets/logo.jpg',
              ),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(
              height: 10,
            ),
            // Text(
            //'DeliveryApp',
            // textAlign: TextAlign.center,
            // style: Theme.of(context)
            //.textTheme
            //.headline4
            //.copyWith(fontWeight: FontWeight.bold),
            //)
          ],
        ),
      ),
    );
  }
}

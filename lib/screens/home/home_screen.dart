import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_line/models/theme.dart';

import 'package:the_line/screens/home/home_controller.dart';
import 'package:the_line/screens/products/productsScreen.dart';
import 'package:the_line/screens/profile/profile_screen.dart';

import '../main_rappi_concept.dart';

class HomeScreen extends GetWidget<HomeController> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.indexSelected.value,
                children: [
                  //const Placeholder(),
                  MinRappiConceptApp(),

                  //const Placeholder(),
                  ProductsScreen(),
                  //const Placeholder(),
                  ProfileScreen(),
                  //const Placeholder(),
                  ProfileScreen(),
                  //const Placeholder(),
                  //ProfileScreen(),
                  //const Placeholder(),
                  //ProductsScreen(),
                  //const Placeholder(),
                ],
              ),
            ),
          ),
          Obx(
            () => _DeliveryNavigation(
              index: controller.indexSelected.value,
              onIndexSelected: (index) {
                controller.updateIndexSelected(index);
                /*
              setState(() {
                currentIndex = index;
              });*/
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DeliveryNavigation extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  _DeliveryNavigation({Key key, this.index, this.onIndexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0), //
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          border: Border.all(
            color: Theme.of(context).bottomAppBarColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: IconButton(
                  icon: Icon(
                    Icons.home,
                    color: index == 0
                        ? DelivryColor.green
                        : DelivryColor.lightGrey,
                  ),
                  onPressed: () => onIndexSelected(0),
                ),
              ),
              // IconButton(icon: Icon(Icons.home),
              ////onPressed: () => onIndexSelected(1),
              //),
              Material(
                child: IconButton(
                  icon: Icon(
                    Icons.store,
                    color: index == 1
                        ? DelivryColor.green
                        : DelivryColor.lightGrey,
                  ),
                  onPressed: () => onIndexSelected(1),
                ),
              ),

              Material(
                child: CircleAvatar(
                  backgroundColor: DelivryColor.purple,
                  radius: 23,
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_basket,
                      color: index == 2
                          ? DelivryColor.green
                          : DelivryColor.lightGrey,
                    ),
                    onPressed: () => onIndexSelected(2),
                  ),
                ),
              ),
              Material(
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: index == 3
                        ? DelivryColor.green
                        : DelivryColor.lightGrey,
                  ),
                  onPressed: () => onIndexSelected(3),
                ),
              ),
              InkWell(
                onTap: () => onIndexSelected(4),
                child: Obx(() {
                  final user = controller.user.value;
                  return user.image == null
                      ? const SizedBox.shrink()
                      : CircleAvatar(
                          radius: 15,
                          // backgroundImage: AssetImage(user.image),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_line/post/loading_overlay.dart';
import 'package:the_line/post/posts_list_item.dart';
import 'package:the_line/screens/home/home_controller.dart';

import 'posts_controller.dart';

class PostsPage extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Obx(
        () => GetBuilder<PostsController>(
          builder: (controller) {
            return LoadingOverlay(
              isLoading: controller.isLoading,
              child: ListView.builder(
                itemCount: controller.postsList.length,
                itemBuilder: (context, index) => PostsListItem(
                  post: controller.postsList[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

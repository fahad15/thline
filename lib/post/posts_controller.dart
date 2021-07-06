import 'package:get/get.dart';
import 'package:the_line/models/repository/api_repository.dart';

import 'package:the_line/post/post.dart';
import 'package:the_line/post/posts_provider.dart';

class PostsController extends GetxController {
  final ApiRepostoryInterface apiRepostoryInterface;

  RxList<Post> postsList = [].obs;
  bool isLoading = true;

  PostsController(this.apiRepostoryInterface);
  @override
  void onInit() {
    PostsProvider().getPostsList(
      onSuccess: (posts) {
        postsList.addAll(posts);
        isLoading = false;
        update();
      },
      onError: (error) {
        isLoading = false;
        update();
        print("Error");
      },
    );
    super.onInit();
  }
}

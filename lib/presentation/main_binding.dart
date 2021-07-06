import 'package:get/state_manager.dart';

import 'package:get/instance_manager.dart';
import 'package:the_line/models/datasource/api_repository_impl.dart';
import 'package:the_line/models/datasource/local_repository_impl.dart';
import 'package:the_line/models/repository/api_repository.dart';
import 'package:the_line/models/repository/local_storage_repository.dart';
import 'package:get/get.dart';
import 'package:the_line/post/posts_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepostoryInterface>(() => ApiRepositoryIml());
  }
}

import 'package:get/get.dart';
import 'package:the_line/models/repository/local_storage_repository.dart';

class ProfileController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;

  ProfileController({
    this.localRepositoryInterface,
  });
}

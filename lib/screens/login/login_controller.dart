import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:the_line/models/exception/auth_exception.dart';
import 'package:the_line/models/repository/api_repository.dart';
import 'package:the_line/models/repository/local_storage_repository.dart';
import 'package:the_line/models/request/login_requst.dart';
import 'package:get/get.dart';

enum LoginState {
  loading,
  initial,
}

class LoginController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepostoryInterface apiRepostoryInterface;

  LoginController({this.localRepositoryInterface, this.apiRepostoryInterface});

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState = LoginState.initial.obs;

  Future<bool> login() async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;
    try {
      loginState(LoginState.loading);
      final loginResponse = await apiRepostoryInterface.login(
        LoginRequest(username, password),
      );
      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);

      return true;
    } on AuthException catch (_) {
      loginState(LoginState.initial);
      return false;
    }
  }
}

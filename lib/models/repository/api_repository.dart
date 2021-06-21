import 'package:the_line/models/request/login_requst.dart';
import 'package:the_line/models/response/login_response.dart';
import 'package:the_line/models/user.dart';

abstract class ApiRepostoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
}

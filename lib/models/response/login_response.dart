import 'package:the_line/models/user.dart';

class LoginResponse {
  final String token;
  final User user;

  const LoginResponse(this.token, this.user);
}

import 'package:the_line/models/exception/auth_exception.dart';
import 'package:the_line/models/repository/api_repository.dart';
import 'package:the_line/models/user.dart';
import 'package:the_line/models/response/login_response.dart';
import 'package:the_line/models/request/login_requst.dart';

class ApiRepositoryIml extends ApiRepostoryInterface {
  //اضافة مستخدميين
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 13));
    if (token == 'AA111') {
      return User(
        name: 'Steve Jobs',
        username: 'stevejobs',
        image: 'assets/users/stevejobs.jpg',
      );
    } else if (token == 'AA222') {
      return User(
        name: 'Elon Musk',
        username: 'elonmusk',
        image: 'assets/users/stevejobs.jpg',
      );
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 3));
    // الدخول للتطبيق
    if (login.username == 'ggg' && login.password == '123') {
      return LoginResponse(
        'AA111',
        User(
          name: 'Steve Jobs',
          username: 'stevejobs',
          image: 'assets/users/stevejobs.jpg',
        ),
      );
    }
    if (login.username == 'steve' && login.password == 'jobs') {
      return LoginResponse(
          'AA222',
          User(
            name: 'Elon Musk',
            username: 'elonmusk',
            image: 'assets/users/stevejobs.jpg',
          ));
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('removing token from server :$token');
    return;
  }
}

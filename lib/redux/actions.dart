
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/models/user.dart';

class LoginUser {
  final Auth auth;

  LoginUser({this.auth});
}

class LoginStart {
  
}

class LoginSuccess {
  final User user;

  LoginSuccess({this.user});
}


class LoginError {
  final String error;

  LoginError({this.error});
}

class LogoutStart {}
class LogoutSuccess {}
class LogoutError {}

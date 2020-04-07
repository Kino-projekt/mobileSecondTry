
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/models/user.dart';

class LoginUser {

  final Auth auth;

  LoginUser({this.auth});
}

class SaveUser {
  
  final User user;

  SaveUser(this.user);

}

class LogoutUser {}


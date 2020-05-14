
import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/models/film.dart';
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


class LoadingFromDBStart {}
class LoadingFromDBSuccess {
  final List<Article> articles;
  final List<Film> films;

  LoadingFromDBSuccess({this.articles, this.films});
}
class LoadingFromDBError {}
class LoadingStart {}
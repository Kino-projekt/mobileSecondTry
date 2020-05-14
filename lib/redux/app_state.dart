import 'package:flutter/foundation.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/models/user.dart';

class AppState {
  
  final User user;
  final bool isLoading;
  final String error;
  final List<Film> films;
  final List<Article> articles;

  const AppState({
    @required this.user,
    @required this.isLoading,
    @required this.error,
    this.films,
    this.articles
  });

  AppState.initialState() : user = User.init(), isLoading = false, error = '', films = new List(), articles = new List();

}
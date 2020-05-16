import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/redux/initial/initial_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class SetInitialStateAction {
  final InitialState initialState;

  SetInitialStateAction(this.initialState);
}

Future<void> getData({Auth auth, store}) async { 
  try {
    store.dispatch(SetInitialStateAction(InitialState(isLoading: true, isError: false, isSuccess: false)));
    
    var articlesResponse = await http.get('https://afternoon-waters-37189.herokuapp.com/api/articles/');
    var filmsResponse = await http.get('https://afternoon-waters-37189.herokuapp.com/api/movies/');
  if(articlesResponse.statusCode == 200 && filmsResponse.statusCode == 200) {
      var articlesBody = await json.decode(articlesResponse.body);
      var filmsBody = await json.decode(filmsResponse.body);
      List<Film> films = Film.listFromJson(filmsBody);
      List<Article> articles = Article.listFromJson(articlesBody);
      return store.dispatch(SetInitialStateAction(InitialState(isLoading: false, isError: false, isSuccess: true, films: films, articles: articles)));
    } else {
      return store.dispatch(SetInitialStateAction(InitialState(isLoading: false, isError: true, isSuccess: false)));
    }
  } catch (err) {
    return store.dispatch(SetInitialStateAction(InitialState(isLoading: false, isError: true, isSuccess: false)));
  }
}


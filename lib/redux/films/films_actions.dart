import 'dart:io';

import 'package:flutter_reduxx/models/comment.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/redux/films/films_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SetFilmsStateAction {
  final FilmsState filmsState;

  SetFilmsStateAction(this.filmsState);
}

Future<void> getFilms({store}) async { 
  if(store.state.filmsState.isSuccess == true) return;
  try {
    store.dispatch(SetFilmsStateAction(FilmsState(isLoading: true, isError: false, isSuccess: false)));
    var filmsResponse = await http.get('https://afternoon-waters-37189.herokuapp.com/api/movies/');

    if(filmsResponse.statusCode == 200) {
        var filmsBody = await json.decode(filmsResponse.body);

        List<Film> films = filmsBody.map<Film>((film) => Film.fromJson(film)).toList();

        return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false, isSuccess: true, films: films)));
      } else {
        return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    print(err);
    return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isSuccess: false)));
  }
}

Future<void> addComment({store, filmId, comment}) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    store.dispatch(SetFilmsStateAction(FilmsState(isLoading: true, isError: false)));
    String token = prefs.getString('token');
    var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/comments/', 
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {
        "content": comment,
        "movieId": filmId.toString(),
      },
    );
    if(res.statusCode == 201) {
      await store.dispatch(getFilms(store: store));
      return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false)));
    } else {
      return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false)));
    }
  } catch (err) {
    print(err);
    return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false)));
  }
}


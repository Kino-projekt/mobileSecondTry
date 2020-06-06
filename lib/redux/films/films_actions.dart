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
    print(filmsResponse.body);
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
      store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false, isSuccess: false)));
      return store.dispatch(getFilms(store: store));
    } else {
      return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false)));
    }
  } catch (err) {
    print(err);
    return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false)));
  }
}

Future<void> addFilm({store, title, director, description}) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    store.dispatch(SetFilmsStateAction(FilmsState(isLoading: true, isError: false)));
    String token = prefs.getString('token');
    var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/admin/movies', 
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {
        "title": title,
        "director": director,
        "description": description,
      },
    );
    if(res.statusCode == 201) {
      store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false, isSuccess: false)));
      return store.dispatch(getFilms(store: store));
    } else {
      return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false)));
    }
  } catch (err) {
    print(err);
    return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false)));
  }
}

Future<void> deleteFilm({store, id}) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    store.dispatch(SetFilmsStateAction(FilmsState(isLoading: true, isError: false)));
    String token = prefs.getString('token');
    var res = await http.delete('https://afternoon-waters-37189.herokuapp.com/api/admin/movies/$id', 
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(res.body);
    if(res.statusCode == 204) {
      store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false, isSuccess: false)));
      return store.dispatch(getFilms(store: store));
    } else {
      return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false)));
    }
  } catch (err) {
    print(err);
    return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false)));
  }
}


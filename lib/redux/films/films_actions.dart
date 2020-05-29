import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/redux/films/films_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

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
        List<Film> films = List();
        for (var item in filmsBody) {
          var newFilm = Film.fromJson(item);
          films.add(newFilm);
        }

        return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: false, isSuccess: true, films: films)));
      } else {
        return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    return store.dispatch(SetFilmsStateAction(FilmsState(isLoading: false, isError: err, isSuccess: false)));
  }
}


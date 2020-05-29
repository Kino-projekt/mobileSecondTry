import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/redux/films/films_actions.dart';
import 'package:flutter_reduxx/redux/films/films_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import 'filmCard.dart';



class FilmList extends StatelessWidget {


  List<Widget> makesSingleFromFilm(films) {
    List<FilmCard> filmList = new List();
    for (Film film in films){
      filmList.add(FilmCard(film: film));
    }
    return filmList;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FilmsState>(
      converter: (store) => store.state.filmsState,
      onInit: Redux.store.dispatch(getFilms(store: Redux.store)),
      builder: (context, filmState) {
       return filmState.isLoading ? 
        Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.black)
        : filmState.films != null && filmState.films.length > 0 ? ListView(
          scrollDirection: Axis.vertical,
          children: makesSingleFromFilm(filmState.films),
        ) : (
           Text('Brak filmów do wyświetlenia')
        );
      }
    );
  }
}
      

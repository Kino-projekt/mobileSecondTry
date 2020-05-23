import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/redux/initial/initial_state.dart';
import 'package:flutter_reduxx/redux/store.dart';

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
    return StoreConnector<AppState, InitialState>(
      distinct: true,
      converter: (store) => store.state.initialState,
      builder: (context, initialState) {
       return initialState.films != null && initialState.films.length > 0 ? ListView(
          scrollDirection: Axis.vertical,
          children: makesSingleFromFilm(initialState.films),
        ) : (
           Text('Brak filmów do wyświetlenia')
        );
      }
    );
  }
}
      

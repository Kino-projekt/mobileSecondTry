import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/redux/films/films_actions.dart';
import 'package:flutter_reduxx/redux/films/films_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import 'adminFilmCard.dart';


class AdminFilmList extends StatefulWidget {

  @override
  _AdminFilmListState createState() => _AdminFilmListState();
}

class _AdminFilmListState extends State<AdminFilmList> {

  String title = '';
  String director = '';
  String description = '';

  List<Widget> makesSingleFromFilms(films) {
    List<AdminFilmCard> filmList = new List();
    for (Film film in films){
      filmList.add(AdminFilmCard(film: film));
    }
    return filmList;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FilmsState>(
      distinct: true,
      onInit: Redux.store.dispatch(getFilms(store: Redux.store)),
      converter: (store) => store.state.filmsState,
      builder: (context, state) {
       return Scaffold(
            appBar: AppBar(
                title: Text('Filmy'),
                backgroundColor: Colors.black,
              ),
            body: state.isLoading ? Center(
              child: (
                Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.black)
              ),
            ) : state.films != null && state.films.length > 0 
              ? ListView(
                scrollDirection: Axis.vertical,
                children: makesSingleFromFilms(state.films),
              ) : (
              Text('Brak filmów do wyświetlenia')
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addFilm');
              },
              backgroundColor: Colors.black,
              child: Icon(Icons.add),
              ),
       );
      }
    );
  }
}
      
  

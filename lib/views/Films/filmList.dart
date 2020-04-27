import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/film.dart';

import 'filmCard.dart';


class FilmList extends StatelessWidget {

  final List<Film> films;

  FilmList({this.films});

  List<Widget> makesSingleFromFilm() {
    List<FilmCard> filmList = new List();
    for (Film film in films){
      filmList.add(FilmCard(film: film));
    }
    return filmList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: makesSingleFromFilm(),
          );
        }
      }
      
  

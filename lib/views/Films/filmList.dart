import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:redux/redux.dart';



class FilmList extends StatelessWidget {


  List<Widget> makesSingleFromFilm(films) {
    // List<FilmCard> filmList = new List();
    // for (Film film in films){
    //   filmList.add(FilmCard(film: film));
    // }
    // return filmList;
    print(films);
  }

  @override
  Widget build(BuildContext context) {
    return
      Text('Films'); 
  }
}
      

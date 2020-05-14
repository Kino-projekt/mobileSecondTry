import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:redux/redux.dart';

import 'filmCard.dart';
import 'filmList_viewmodel.dart';


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
    return new StoreConnector<AppState, FilmListViewModel>(
      converter: ((Store<AppState> store) => FilmListViewModel.create(store)),
      builder: (BuildContext context, FilmListViewModel viewModel) =>
        ListView(
          scrollDirection: Axis.vertical,
          children: makesSingleFromFilm(viewModel.films),
          ));
        }
}
      
  

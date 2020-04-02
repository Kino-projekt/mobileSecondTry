import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/showing.dart';

import 'filmCard.dart';

class FilmList extends StatelessWidget {

  final List<Showing> showing;

  FilmList({this.showing});

  List<Widget> makesSingleFromShowing() {
    List<FilmCard> filmList = new List();
    for (Showing show in showing){
      filmList.add(FilmCard(show: show));
    }
    return filmList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: makesSingleFromShowing(),
          );
        }
      }
      
  

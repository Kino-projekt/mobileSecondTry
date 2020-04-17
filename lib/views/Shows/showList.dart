import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/showing.dart';

import 'showCard.dart';

class ShowingList extends StatelessWidget {

  final List<Showing> showing;

  ShowingList({this.showing});

  List<Widget> makesSingleFromShowing() {
    List<ShowCard> filmList = new List();
    for (Showing show in showing){
      filmList.add(ShowCard(show: show));
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
      
  

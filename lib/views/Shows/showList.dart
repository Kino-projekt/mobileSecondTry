import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/showing.dart';
import 'package:flutter_reduxx/redux/initial/initial_state.dart';
import 'package:flutter_reduxx/redux/store.dart';

import 'showCard.dart';

class ShowingList extends StatelessWidget {


  List<Widget> makesSingleFromShowing(showing) {
    List<ShowCard> showingList = new List();
    for (Showing show in showing){
      showingList.add(ShowCard(show: show));
    }
    return showingList;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialState>(
      distinct: true,
      converter: (store) => store.state.initialState,
      builder: (context, initialState) {
       return initialState.shows != null && initialState.shows.length > 0 ? ListView(
          scrollDirection: Axis.vertical,
          children: makesSingleFromShowing(initialState.shows),
        ) : (
           Text('Brak senasów do wyświetlenia')
        );
      }
    );
  }
}
      
  

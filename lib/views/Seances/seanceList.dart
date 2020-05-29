import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/seances.dart';
import 'package:flutter_reduxx/redux/initial/initial_state.dart';
import 'package:flutter_reduxx/redux/store.dart';

import 'seanceCard.dart';

class SeanceList extends StatelessWidget {


  List<Widget> makesSingleFromSeances(seances) {
    List<SeanceCard> seancesList = new List();
    for (Seances seance in seances){
      seancesList.add(SeanceCard(seance: seance));
    }
    return seancesList;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialState>(
      distinct: true,
      converter: (store) => store.state.initialState,
      builder: (context, initialState) {
       return initialState.shows != null && initialState.shows.length > 0 ? ListView(
          scrollDirection: Axis.vertical,
          children: makesSingleFromSeances(initialState.shows),
        ) : (
           Text('Brak senasów do wyświetlenia')
        );
      }
    );
  }
}
      
  

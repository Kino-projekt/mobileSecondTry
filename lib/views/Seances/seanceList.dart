import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/seance.dart';
import 'package:flutter_reduxx/redux/seances/seances_actions.dart';
import 'package:flutter_reduxx/redux/seances/seances_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import 'seanceCard.dart';

class SeanceList extends StatelessWidget {


  List<Widget> makesSingleFromSeances(seances) {
    List<SeanceCard> seancesList = new List();
    for (Seance seance in seances){
      seancesList.add(SeanceCard(seance: seance));
    }
    return seancesList;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SeancesState>(
      onInit: Redux.store.dispatch(getSeances(store: Redux.store)),
      converter: (store) => store.state.seancesState,
      builder: (context, state) {
       return state.isLoading ? 
       Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.black)
       : state.seances != null && state.seances.length > 0 ? ListView(
          scrollDirection: Axis.vertical,
          children: makesSingleFromSeances(state.seances),
        ) : (
           Text('Brak senasów do wyświetlenia')
        );
      }
    );
  }
}
      
  

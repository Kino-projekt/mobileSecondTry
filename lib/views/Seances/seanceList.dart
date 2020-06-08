import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/seance.dart';
import 'package:flutter_reduxx/redux/seances/seances_actions.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import 'seanceCard.dart';

class SeanceList extends StatelessWidget {


  List<Widget> makesSingleFromSeances(seances, userEmail) {
    List<SeanceCard> seancesList = new List();
    for (Seance seance in seances){
      seancesList.add(SeanceCard(seance: seance, user: userEmail != null));
    }
    return seancesList;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      onInit: Redux.store.dispatch(getSeances(store: Redux.store)),
      converter: (store) => store.state,
      builder: (context, appState) {
       return appState.seancesState.isLoading ? 
       Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.black)
       : appState.seancesState.seances != null && appState.seancesState.seances.length > 0 ? ListView(
          scrollDirection: Axis.vertical,
          children: makesSingleFromSeances(appState.seancesState.seances, appState.loginState.user.email),
        ) : (
           Text('Brak senasów do wyświetlenia')
        );
      }
    );
  }
}
      
  

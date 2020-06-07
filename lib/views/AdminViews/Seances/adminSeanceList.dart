import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/seance.dart';
import 'package:flutter_reduxx/redux/seances/seances_actions.dart';
import 'package:flutter_reduxx/redux/seances/seances_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import 'adminSeanceCard.dart';


class AdminSeanceList extends StatefulWidget {

  @override
  _AdminSeanceListState createState() => _AdminSeanceListState();
}

class _AdminSeanceListState extends State<AdminSeanceList> {

  String filmId = '';
  String hallId = '';

  List<Widget> makesSingleFromSeances(seances) {
    List<AdminSeanceCard> seanceList = new List();
    for (Seance seance in seances){
      seanceList.add(AdminSeanceCard(seance: seance));
    }
    return seanceList;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SeancesState>(
      distinct: true,
      onInit: Redux.store.dispatch(getSeances(store: Redux.store)),
      converter: (store) => store.state.seancesState,
      builder: (context, state) {
       return Scaffold(
            appBar: AppBar(
                title: Text('Seanse'),
                backgroundColor: Colors.black,
              ),
            body: state.isLoading ? Center(
              child: (
                Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.black)
              ),
            ) : state.seances != null && state.seances.length > 0 
              ? ListView(
                scrollDirection: Axis.vertical,
                children: makesSingleFromSeances(state.seances),
              ) : (
              Text('Brak seansów do wyświetlenia')
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addSeance');
              },
              backgroundColor: Colors.black,
              child: Icon(Icons.add),
              ),
       );
      }
    );
  }
}
      
  

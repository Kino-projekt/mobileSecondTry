import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/hall.dart';
import 'package:flutter_reduxx/redux/halls/halls_actions.dart';
import 'package:flutter_reduxx/redux/halls/halls_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import 'adminHallCard.dart';


class AdminHallList extends StatefulWidget {

  @override
  _AdminHallListState createState() => _AdminHallListState();
}

class _AdminHallListState extends State<AdminHallList> {
  List<Widget> makesSingleFromHall(halls) {
    List<AdminHallCard> hallList = new List();
    for (Hall hall in halls){
      hallList.add(AdminHallCard(hall: hall));
    }
    return hallList;
  }

  String title = '';
  String description = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HallsState>(
      distinct: true,
      onInit: Redux.store.dispatch(getHalls(store: Redux.store)),
      converter: (store) => store.state.hallsState,
      builder: (context, state) {
       return Scaffold(
            appBar: AppBar(
                title: Text('Hale'),
                backgroundColor: Colors.black,
              ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addHall');
              },
              backgroundColor: Colors.black,
              child: Icon(Icons.add),
              ),
            body: state.isLoading ? Center(
              child: (
                Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.black)
                ),
            ) : state.halls != null && state.halls.length > 0 
              ? ListView(
                scrollDirection: Axis.vertical,
                children: makesSingleFromHall(state.halls),
              ) : (
              Text('Brak hal do wyświetlenia')
          ),
       );
      }
    );
  }
}
      
  

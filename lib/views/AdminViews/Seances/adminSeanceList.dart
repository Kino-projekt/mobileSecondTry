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
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  final _formKey = GlobalKey<FormState>();

  List<Widget> makesSingleFromSeances(seances) {
    List<AdminSeanceCard> seanceList = new List();
    for (Seance seance in seances){
      seanceList.add(AdminSeanceCard(seance: seance));
    }
    return seanceList;
  }

  Future selectDate(BuildContext context) async {
    final datePicked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2022));
    if(datePicked != null && datePicked != date){
      setState(() {
        date = datePicked;
      });
      print(date);
    }
  }

  Future selectTime(BuildContext context) async {
    final timePicked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if(timePicked != null && timePicked != time){
      setState(() {
        time = timePicked;
      });
      print(time);
    }
  }

  @override
  Widget build(BuildContext context) {
    var newDate = date;
    var newTime = time;
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
                showDialog(
                context: context,
                builder: (BuildContext context) =>
                  SingleChildScrollView(
                                      child: AlertDialog(
                      title: Text('Dodawanie nowego seansu'),
                      content: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                          TextFormField(
                            onChanged: (val) => setState(() => filmId = val),
                            validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                            decoration: InputDecoration(
                              labelText: 'Id filmu'
                            ),
                          ),
                          TextFormField(
                            onChanged: (val) => setState(() => hallId = val),
                            validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                            decoration: InputDecoration(
                              labelText: 'Id hali'
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: (){
                                selectDate(context);
                              }
                            ),
                          Text('${newDate.day}.${newDate.month}.${newDate.year}'),
                            ]
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                            icon: Icon(Icons.alarm),
                            onPressed: (){
                              selectTime(context);
                            }
                          ),
                          Text(newTime.format(context).toString()),
                            ],
                          )
                        ],
                        ),
                      ),
                      actions: [
                        FlatButton(
                          onPressed: () async {
                            // await Redux.store.dispatch(addSeance(store: Redux.store, title: title, director: director, description: description));
                            Navigator.of(context).pop();
                            print(date);
                          },
                          textColor: Colors.greenAccent,
                          child: Text('DODAJ')
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          textColor: Colors.black,
                          child: Text('ANULUJ')
                        ),
                      ],
                    ),
                  )
                );
              },
              backgroundColor: Colors.black,
              child: Icon(Icons.add),
              ),
       );
      }
    );
  }
}
      
  

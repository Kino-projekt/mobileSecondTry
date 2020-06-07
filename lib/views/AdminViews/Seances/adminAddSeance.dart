import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/films/films_actions.dart';
import 'package:flutter_reduxx/redux/halls/halls_actions.dart';
import 'package:flutter_reduxx/redux/seances/seances_actions.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';


class AddSeance extends StatefulWidget {


  @override
  _AddSeanceState createState() => _AddSeanceState();
}

class _AddSeanceState extends State<AddSeance> with SingleTickerProviderStateMixin {
  String filmId;
  String hallId;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay(hour: 0, minute: 0);
  final _formKey = GlobalKey<FormState>();

    Future selectDate(BuildContext context) async {
    final datePicked = await showDatePicker(context: context, initialDate: date, firstDate: DateTime.now(), lastDate: DateTime(2022));
    if(datePicked != null && datePicked != date){
      setState(() {
        date = datePicked;
      });
    }
  }

  Future selectTime(BuildContext context) async {
    final timePicked = await showTimePicker(context: context, initialTime: time);
    if(timePicked != null && timePicked != time){
      setState(() {
        time = timePicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (
      StoreConnector<AppState, AppState>(
        distinct: true,
        converter: (store) => store.state,
        onWillChange: (AppState prev, AppState state) {
          if(prev.seancesState.seances.length != state.seancesState.seances.length) {
            Navigator.of(context).pop((route) => false);
            return null;
          }
        },
        onInit: (state) {
          if(state.state.filmsState.films == null || state.state.hallsState.halls == null){
            Redux.store.dispatch(getHalls(store: Redux.store));
            Redux.store.dispatch(getFilms(store: Redux.store));
          } else return;  
        },
        builder: (context, appState) {
          if (appState.seancesState.isLoading || appState.filmsState.isLoading || appState.hallsState.isLoading) {
            return Center(
                  child: Loading(indicator: BallPulseIndicator(), size: 100.0),
                );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Dodaj seans'),
                backgroundColor: Colors.black,
              ),
              body: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        child: Column(
                        children: <Widget>[
                          DropdownButton<String>(
                            hint: Text('Wybierz film'),
                            value: filmId,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                filmId = newValue;
                              });
                            },
                            items: appState.filmsState.films.map<DropdownMenuItem<String>>((film) => DropdownMenuItem(value: film.title, child: Text(film.title))).toList(),
                          ),
                          DropdownButton<String>(
                            hint: Text('Wybierz hale'),
                            value: hallId,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                hallId = newValue;
                              });
                            },
                            items: appState.hallsState.halls.map<DropdownMenuItem<String>>((film) => DropdownMenuItem(value: film.name, child: Text(film.name))).toList(),
                          ),
                          SizedBox(height: 10.0),
                          appState.seancesState.isError ? Text('Złe dane!', style: TextStyle(color: Colors.redAccent)) : SizedBox(),
                          FlatButton(
                            onPressed: (){
                              selectDate(context);
                            }, 
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(icon: Icon(Icons.calendar_today), onPressed: null),
                              Text('${date.day}.${date.month}.${date.year}'),
                            ],)
                          ),
                          FlatButton(
                            onPressed: (){
                              selectTime(context);
                            }, 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(icon: Icon(Icons.timer), onPressed: null),
                                Text(time.format(context).toString())
                              ],
                            )
                          ),
                          FlatButton(
                              onPressed: () async {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }
                                var film = appState.filmsState.films.where((film) => film.title.contains(filmId)).toList()[0];
                                var hall = appState.hallsState.halls.where((hall) => hall.name.contains(hallId)).toList()[0];
                                await Redux.store.dispatch(addSeance(store: Redux.store, hallId: hall.id, filmId: film.id, date: new DateTime(date.year, date.month, date.day, time.hour, time.minute)));
                              },
                              color: Colors.pinkAccent,
                              child: Text(
                                'DODAJ SEANS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                ),
              )
            );
          }
        },
      )
    );
  }
}
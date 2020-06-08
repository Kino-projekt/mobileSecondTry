import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/halls/halls_actions.dart';
import 'package:flutter_reduxx/redux/halls/halls_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';


class AddHall extends StatefulWidget {


  @override
  _AddHallState createState() => _AddHallState();
}

class _AddHallState extends State<AddHall> with SingleTickerProviderStateMixin {
  String name;
  String countOfSeats;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (
      StoreConnector<AppState, HallsState>(
        distinct: true,
        converter: (store) => store.state.hallsState,
        onWillChange: (HallsState prev, HallsState state) {
          if(prev.halls.length != state.halls.length) {
            Navigator.of(context).pop((route) => false);
            return null;
          }
        },
        builder: (context, hallsState) {
          if (hallsState.isLoading) {
            return Center(
                  child: Loading(indicator: BallPulseIndicator(), size: 100.0),
                );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Dodaj hale'),
                backgroundColor: Colors.black,
              ),
              body: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        child: Column(
                        children: <Widget>[
                         TextFormField(
                          onChanged: (val) => setState(() => name = val),
                          validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                          decoration: InputDecoration(
                            labelText: 'Wpisz nazwę hali'
                          ),
                        ),
                        TextFormField(
                          onChanged: (val) => setState(() => countOfSeats = val),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Wpisz liczbę miejsc'
                          ),
                        ),
                        SizedBox(height: 30),
                          FlatButton(
                              onPressed: () async {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                } else {
                                  Redux.store.dispatch(addHall(store: Redux.store, name: name, countOfSeats: int.parse(countOfSeats)));
                                }                              
                              },
                              color: Colors.pinkAccent,
                              child: Text(
                                'DODAJ NOWĄ HALE',
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
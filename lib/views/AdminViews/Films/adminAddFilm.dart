import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/films/films_actions.dart';
import 'package:flutter_reduxx/redux/films/films_state.dart';
import 'package:flutter_reduxx/redux/halls/halls_actions.dart';
import 'package:flutter_reduxx/redux/seances/seances_actions.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';


class AddFilm extends StatefulWidget {


  @override
  _AddFilmState createState() => _AddFilmState();
}

class _AddFilmState extends State<AddFilm> with SingleTickerProviderStateMixin {
  String title;
  String director;
  String description;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (
      StoreConnector<AppState, FilmsState>(
        distinct: true,
        converter: (store) => store.state.filmsState,
        onWillChange: (FilmsState prev, FilmsState state) {
          if(prev.films.length != state.films.length) {
            Navigator.of(context).pop((route) => false);
            return null;
          }
        },
        builder: (context, filmState) {
          if (filmState.isLoading) {
            return Center(
                  child: Loading(indicator: BallPulseIndicator(), size: 100.0),
                );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Dodaj film'),
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
                          onChanged: (val) => setState(() => title = val),
                          validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                          decoration: InputDecoration(
                            labelText: 'Wpisz tytuł filmu'
                          ),
                        ),
                        TextFormField(
                          onChanged: (val) => setState(() => director = val),
                          validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                          decoration: InputDecoration(
                            labelText: 'Wpisz producenta filmu'
                          ),
                        ),
                        TextFormField(
                          onChanged: (val) => setState(() => description = val),
                          validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                          decoration: InputDecoration(
                            labelText: 'Wpisz opis filmu'
                          ),
                        ),
                          SizedBox(height: 30),
                          FlatButton(
                              onPressed: () async {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                } else {
                                  Redux.store.dispatch(addFilm(store: Redux.store, title: title, description: description, director: director));
                                }                              
                              },
                              color: Colors.pinkAccent,
                              child: Text(
                                'DODAJ NOWY FILM',
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
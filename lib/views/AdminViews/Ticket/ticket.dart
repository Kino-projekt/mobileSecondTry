import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';


class Ticket extends StatefulWidget {


  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> with SingleTickerProviderStateMixin {

  final _formKey = GlobalKey<FormState>();
  String ticket = '';
  @override
  Widget build(BuildContext context) {
    return (
      StoreConnector<AppState, AppState>(
        distinct: true,
        converter: (store) => store.state,
        builder: (context, appState) {
          if (appState.seancesState.isLoading || appState.filmsState.isLoading || appState.hallsState.isLoading) {
            return Center(
                  child: Loading(indicator: BallPulseIndicator(), size: 100.0),
                );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Sprawdź bilet'),
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
                          onChanged: (val) => setState(() => ticket = val),
                          validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                          decoration: InputDecoration(
                            labelText: 'Wpisz numer biletu'
                          ),
                        ),
                          
                          FlatButton(
                              onPressed: () async {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Container(
                                        height: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('Bilet $ticket poprawny!')
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                }                              
                              },
                              color: Colors.pinkAccent,
                              child: Text(
                                'SPRWADŹ BILET',
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
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/redux/login/login_actions.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:flutter_reduxx/redux/register/register_actions.dart';
import 'package:flutter_reduxx/redux/register/register_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RegisterState>(
      distinct: true,
      converter: (store) => store.state.registerState,
      builder: (context, registerState) {
        if (registerState.isLoading) {
          return Center(
                child: Loading(indicator: BallPulseIndicator(), size: 100.0),
              );
        } else return
    Scaffold(
      appBar: AppBar(
        title: Text('Zarejestruj się'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (val) => setState(() => email = val),
                  validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                  decoration: InputDecoration(
                    labelText: 'Enter your username'
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) => setState(() => password = val),
                  validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                  decoration: InputDecoration(
                    labelText: 'Enter your password'
                  ),
                ),
                SizedBox(height: 10.0),
                registerState.isSuccess ? Text(
                  'Zarejestrowano! Teraz możesz się zalogowć!',
                  style: TextStyle(color: Colors.greenAccent)
                ) : SizedBox(),
                registerState.isError ? Text(
                  'Nieodopowiedni format danych!',
                  style: TextStyle(color: Colors.redAccent)
                ) : SizedBox(),
                FlatButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await Redux.store.dispatch(registerUser(auth: Auth(email: email, password: password), store: Redux.store));
                    };
                  },
                  color: Colors.pinkAccent,
                  child: Text(
                    'ZAREJESTRUJ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
        ),
      )
    );
  });
  }
}
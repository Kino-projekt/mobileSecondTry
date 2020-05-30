

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:flutter_reduxx/redux/store.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
     return (
      StoreConnector<AppState, LoginState>(
        distinct: true,
        converter: (store) => store.state.loginState,
        builder: (context, loginState) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Ustawienia'),
              backgroundColor: Colors.black,
            ),
            body: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text('Ustawienia'),
            )
          );
        }
      )
    );
  }
}
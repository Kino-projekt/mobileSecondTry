import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/redux/login/login_actions.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';


class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  Widget getTextWidgets(List<String> errors)
  {
    List<Widget> errorWidget = new List<Widget>();
    for(var i = 0; i < errors.length; i++){
        errorWidget.add(new Text(errors[i], style: TextStyle(color: Colors.redAccent)));
    }
    return new Row(children: errorWidget);
  }

  
  @override
  Widget build(BuildContext context) {
    return (
      StoreConnector<AppState, LoginState>(
        distinct: true,
        converter: (store) => store.state.loginState,
        onWillChange: (LoginState prev, LoginState state) {
          if(prev.user != state.user) {
            Navigator.of(context).pop((route) => false);
            return null;
          }
        },
        builder: (context, loginState) {
          if (loginState.isLoading) {
            return Center(
                  child: Loading(indicator: BallPulseIndicator(), size: 100.0),
                );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Zaloguj się'),
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
                            labelText: 'Enter your email'
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
                        loginState.isError ? Text('Złe dane!', style: TextStyle(color: Colors.redAccent)) : SizedBox(),
                        FlatButton(
                            onPressed: () async {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              await Redux.store.dispatch(loginUser(auth: Auth(email: email, password: password), store: Redux.store));
                            },
                            color: Colors.pinkAccent,
                            child: Text(
                              'ZALOGUJ',
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
          }
        },
      )
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:flutter_reduxx/redux/middleware.dart';
import 'package:flutter_reduxx/views/home.dart';
import 'package:redux/redux.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'login_viewmodel.dart';
import '../../redux/actions.dart';


class Login extends StatefulWidget {
  Store<AppState> store;

  Login(store);

  @override
  _LoginState createState() => _LoginState(store);
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  String email = '';
  String password = '';
  final Store<AppState> store;
  final _formKey = GlobalKey<FormState>();

  _LoginState(this.store);

  
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LoginViewModel>(
      converter: ((Store<AppState> store) => LoginViewModel.create(store)),
      onWillChange: (LoginViewModel viewModel) {
        if(viewModel.user.email != '') {
           Navigator.of(context).pop((route) => false);
           return null;
        }
      },
      builder: (BuildContext context, LoginViewModel viewModel)  {
        // if(viewModel.user.email != '') {
        //    Navigator.of(context).pop((route) => false);
        //    return null;
        // }
        return (
          viewModel.isLoading ? 
            Center(
              child: Loading(indicator: BallPulseIndicator(), size: 100.0),
            )
            :
            Scaffold(
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
                      FlatButton(
                          onPressed: () async {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            await viewModel.loginUser(Auth(email: email, password: password));
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
                        Text(viewModel.user.email),
                    ],
                  ),
              ),
            )
          )
        );
      }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:redux/redux.dart';

import 'login_viewmodel.dart';


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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  _LoginState(this.store);

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Logowanie'),
      backgroundColor: Colors.pinkAccent,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                new StoreConnector<AppState, LoginViewModel>(
                  converter: ((Store<AppState> store) => LoginViewModel.create(store)),
                  builder: (BuildContext context, LoginViewModel viewModel) => 
                  FlatButton(
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _displaySnackBar(context);
                        viewModel.login(Auth(email: email, password: password));
                        print(viewModel.user);
                        // Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                      },
                      color: Colors.pinkAccent,
                      child: Text(
                        'ZALOGUJ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ),
              ],
            ),
        ),
      )
    );
  }

  void buildDispatch(Store<AppState> store) => store.dispatch(LoginUser);
}
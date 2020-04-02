import 'dart:async';
import 'dart:convert';
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'app_state.dart';


Future<AppState> logInUser(Auth auth) async {
  
  Future<http.Response> response = http.post('https://afternoon-waters-37189.herokuapp.com/api/signin/', body: {
    'email': auth.email,
    'password': auth.password,
  });
  print(json.encode(response));
  return AppState.initialState();
}

void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  switch (action) {
    case LoginUser:
      await logInUser(action.auth);
        // .then((user) => store.dispatch(SaveUser(user)));
      break;
    case SaveUser:
      
      break;
    default:
  }
}
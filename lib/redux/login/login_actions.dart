import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class SetLoginStateAction {
  final LoginState loginState;

  SetLoginStateAction(this.loginState);
}

Future<void> loginUser({Auth auth, store}) async { 
  try {
    store.dispatch(SetLoginStateAction(LoginState(isLoading: true, isError: false)));
    
    var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/auth/signin/', body: {
      "password": auth.password,
      "email": auth.email,
    });
  if(res.statusCode == 200) {
      var body = await json.decode(res.body);
      User user = User.fromJson(body);
      return store.dispatch(SetLoginStateAction(LoginState(isLoading: false, isError: false, user: user)));
    } else {
      return store.dispatch(SetLoginStateAction(LoginState(isLoading: false, isError: true)));
    }
  } catch (err) {
    return store.dispatch(SetLoginStateAction(LoginState(isLoading: false, isError: true)));
  }
}

Future<void> logoutUser (store) async {
  print('wylogowywanie');
  return store.dispatch(SetLoginStateAction(LoginState.initial()));
}


import 'dart:io';

import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SetLoginStateAction {
  final LoginState loginState;

  SetLoginStateAction(this.loginState);
}

Future<void> loginUser({Auth auth, store}) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    store.dispatch(SetLoginStateAction(LoginState(isLoading: true, isError: false)));
    
    var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/auth/signin/', body: {
      "password": auth.password,
      "email": auth.email,
    });
  if(res.statusCode == 200) {
      var body = await json.decode(res.body);
      User user = User.fromJson(body[0]);

      await prefs.setString('token', body[1]['accessToken']);
      await prefs.setInt('id', user.id);
      return store.dispatch(SetLoginStateAction(LoginState(isLoading: false, isError: false, user: user)));
    } else {
      return store.dispatch(SetLoginStateAction(LoginState(isLoading: false, isError: true)));
    }
  } catch (err) {
    return store.dispatch(SetLoginStateAction(LoginState(isLoading: false, isError: true)));
  }
}

Future<void> logoutUser (store) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return store.dispatch(SetLoginStateAction(LoginState.initial()));
}

Future<void> getUserFromLocal({store}) async {
  if(store.state.loginState.isInitialized == true) return;
  store.dispatch(SetLoginStateAction(LoginState(isLoading: true, isError: false)));
  try {
  SharedPreferences prefs = await SharedPreferences.getInstance();

      var id = prefs.getInt('id');
      var token = prefs.getString('token');
      var res = await http.get('https://afternoon-waters-37189.herokuapp.com/api/users/$id', headers: {HttpHeaders.authorizationHeader: token});

      if(res.statusCode == 200){
        var body = await json.decode(res.body);
        User user = User.fromJson(body);

        return store.dispatch(SetLoginStateAction(LoginState(isLoading: false, isError: false, user: user, isInitialized: true)));
      } else {
        return store.dispatch(SetLoginStateAction(LoginState(isLoading: false, isError: false, user: User.init(), isInitialized: true)));
      }
  } catch(err){
    print(err);
  }
}


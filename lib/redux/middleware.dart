import 'dart:async';
import 'dart:convert';
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/models/role.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'app_state.dart';


Future<User> logInUser(Auth auth, store) async {
  var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/auth/signin/', body: {
    "password": auth.password,
    "email": auth.email,
  });
  if(res.statusCode == 200) {
      var body = await jsonDecode(res.body);
  
      Role role = Role.USER;
      if(body[0]['role'] == 'ADMIN') role = Role.ADMIN;
      User user = User(email: body[0]['email'], id: body[0]['id'], role: role, token: body[1]['accessToken']);
      return store.dispatch(SaveUser(user));
    } else {
      var body = jsonDecode(res.body);
      dynamic error = body['error'];
      print(error);
      return User.init();
    } 
}


void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {

  if(action is LoginUser){
    await logInUser(action.auth, store);
  }
  next(action);
}
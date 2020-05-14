import 'dart:convert';
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/models/role.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'app_state.dart';


loginUser(Auth auth, store) async { 
  try {
    store.dispatch(LoadingStart());
    var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/auth/signin/', body: {
      "password": auth.password,
      "email": auth.email,
    });

  if(res.statusCode == 200) {
      var body = await jsonDecode(res.body);
      Role role = Role.USER;
      if(body[0]['role'] == 'ADMIN') role = Role.ADMIN;
      User user = User(email: body[0]['email'], id: body[0]['id'], role: role, token: body[1]['accessToken']);
      return store.dispatch(LoginSuccess(user: user));
    } else return store.dispatch(LoginError(error: 'Coś poszło nie tak!'));
  } catch (err) {
    return store.dispatch(LoginError(error: err));
  }

}

getData(store) async {
  try {
    store.dispatch(LoadingStart());
    var articles = await http.get('https://afternoon-waters-37189.herokuapp.com/api/articles/');
    var movies = await http.get('https://afternoon-waters-37189.herokuapp.com/api/movies/');
    var moviesBody = await jsonDecode(movies.body);
    var articlesBody = await jsonDecode(articles.body);

    moviesBody.map((movie) => print(movie));
    // return store.dispatch(LoadingFromDBSuccess(articles: articlesBody, films: moviesBody));
  } catch(err) {
    return store.dispatch(LoadingFromDBError());
  }
}



void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {

  if(action is LoginUser){
    await loginUser(action.auth, store);
  }
   if(action is LoadingFromDBStart){
    await getData(store);
  }
  next(action);
}
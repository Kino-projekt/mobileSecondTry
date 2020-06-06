import 'dart:io';

import 'package:flutter_reduxx/models/seance.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/users/users_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SetUsersStateAction {
  final UsersState usersState;

  SetUsersStateAction(this.usersState);
}

Future<void> getUsers({store}) async { 

  if(store.state.usersState.isSuccess == true) return;

  try {
    store.dispatch(SetUsersStateAction(UsersState(isLoading: true, isError: false, isSuccess: false)));
    var usersResponse = await http.get('https://afternoon-waters-37189.herokuapp.com/api/users/');

    if(usersResponse.statusCode == 200) {
        var usersBody = await json.decode(usersResponse.body);
        List<User> users = usersBody.map<User>((user) => User.fromJson(user)).toList();

        return store.dispatch(SetUsersStateAction(UsersState(isLoading: false, isError: false, isSuccess: true, users: users)));
      } else {
        return store.dispatch(SetUsersStateAction(UsersState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    print(err);
  }
}

Future<void> banUser({store, id}) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    store.dispatch(SetUsersStateAction(UsersState(isLoading: true, isError: false, isSuccess: false)));
    String token = prefs.getString('token');
    var usersResponse = await http.get('https://afternoon-waters-37189.herokuapp.com/api/admin/users/$id/ban',
     headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    if(usersResponse.statusCode == 204) {
        var usersBody = await json.decode(usersResponse.body);
        List<User> users = usersBody.map<User>((user) => User.fromJson(user)).toList();

        return store.dispatch(SetUsersStateAction(UsersState(isLoading: false, isError: false, isSuccess: true, users: users)));
      } else {
        return store.dispatch(SetUsersStateAction(UsersState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    print(err);
  }
}

Future<void> giveAdmin({store, id}) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    store.dispatch(SetUsersStateAction(UsersState(isLoading: true, isError: false, isSuccess: false)));
    String token = prefs.getString('token');
    print(id);
    var usersResponse = await http.patch('https://afternoon-waters-37189.herokuapp.com/api/admin/users/$id/update-role',
     headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(usersResponse.body);
    if(usersResponse.statusCode == 200) {
        return store.dispatch(getUsers(store: store));
      } else {
        return store.dispatch(SetUsersStateAction(UsersState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    print(err);
  }
}

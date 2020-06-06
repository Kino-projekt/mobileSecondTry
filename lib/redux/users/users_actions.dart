import 'package:flutter_reduxx/models/seance.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/users/users_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

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


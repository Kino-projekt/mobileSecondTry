import 'package:flutter_reduxx/redux/users/users_actions.dart';
import 'package:flutter_reduxx/redux/users/users_state.dart';

usersReduce(UsersState prevState, SetUsersStateAction action) {
  final payload = action.usersState;
  return prevState.copyWith(isError: payload.isError, isLoading: payload.isLoading, isSuccess: payload.isSuccess, users: payload.users);
}
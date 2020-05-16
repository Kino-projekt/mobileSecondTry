import 'package:flutter_reduxx/redux/login/login_actions.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';

loginReducer(LoginState prevState, SetLoginStateAction action) {
  final payload = action.loginState;
  return prevState.copyWith(isError: payload.isError, isLoading: payload.isLoading, user: payload.user);
}
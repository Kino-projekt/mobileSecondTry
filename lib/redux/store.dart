import 'package:flutter/foundation.dart';
import 'package:flutter_reduxx/redux/login/login_actions.dart';
import 'package:flutter_reduxx/redux/login/login_reducer.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:flutter_reduxx/redux/register/register_actions.dart';
import 'package:flutter_reduxx/redux/register/register_reducer.dart';
import 'package:flutter_reduxx/redux/register/register_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetLoginStateAction) {
    final nextLoginState = loginReducer(state.loginState, action);

    return state.copyWith(loginState: nextLoginState);
  }
  if (action is SetRegisterStateAction) {
    final nextRegisterState = registerReducer(state.registerState, action);

    return state.copyWith(registerState: nextRegisterState);
  }

  return state;
}

class AppState {
  
  final LoginState loginState;
  final RegisterState registerState;

  AppState({
    @required this.loginState,
    @required this.registerState,
  });

  AppState copyWith({
    LoginState loginState,
    RegisterState registerState,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
      registerState: registerState ?? this.registerState,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final loginStateInitial = LoginState.initial();
    final registerStateInitial = RegisterState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(loginState: loginStateInitial, registerState: registerStateInitial),
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter_reduxx/redux/initial/initial_actions.dart';
import 'package:flutter_reduxx/redux/initial/initial_state.dart';
import 'package:flutter_reduxx/redux/login/login_actions.dart';
import 'package:flutter_reduxx/redux/login/login_reducer.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:flutter_reduxx/redux/register/register_actions.dart';
import 'package:flutter_reduxx/redux/register/register_reducer.dart';
import 'package:flutter_reduxx/redux/register/register_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'initial/initial_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetLoginStateAction) {
    final nextLoginState = loginReducer(state.loginState, action);

    return state.copyWith(loginState: nextLoginState);
  }

  if (action is SetRegisterStateAction) {
    final nextRegisterState = registerReducer(state.registerState, action);

    return state.copyWith(registerState: nextRegisterState);
  }

  if (action is SetInitialStateAction) {
    final nextInitialState = initialReducer(state.initialState, action);

    return state.copyWith(initialState: nextInitialState);
  }

  return state;
}

class AppState {
  
  final LoginState loginState;
  final RegisterState registerState;
  final InitialState initialState;

  AppState({
    @required this.loginState,
    @required this.registerState,
    @required this.initialState,
  });

  AppState copyWith({
    LoginState loginState,
    RegisterState registerState,
    InitialState initialState,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
      registerState: registerState ?? this.registerState,
      initialState: initialState ?? this.initialState,
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
    final initialStateInitial = InitialState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(loginState: loginStateInitial, registerState: registerStateInitial, initialState: initialStateInitial),
    );
  }
}
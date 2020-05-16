import 'package:flutter/foundation.dart';
import 'package:flutter_reduxx/redux/login/login_actions.dart';
import 'package:flutter_reduxx/redux/login/login_reducer.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetLoginStateAction) {
    final nextLoginState = loginReducer(state.loginState, action);

    return state.copyWith(loginState: nextLoginState);
  }

  return state;
}

class AppState {
  
  final LoginState loginState;

  AppState({
    @required this.loginState,
  });

  AppState copyWith({
    LoginState loginState,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
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

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(loginState: loginStateInitial),
    );
  }
}
import 'dart:async';
import 'package:flutter_reduxx/redux/reducers.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';
import 'middleware.dart';


Future<Store<AppState>> createStore() async {
  return Store(
    appStateReducer,
    initialState: AppState.initialState(),
    middleware: [
      appStateMiddleware
    ],
  );
}
import 'package:flutter/foundation.dart';
import 'package:flutter_reduxx/models/user.dart';

class AppState {
  
  final User user;

  const AppState({
    @required this.user,
  });

  AppState.initialState() : user = null;

}
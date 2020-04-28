import 'package:flutter/foundation.dart';
import 'package:flutter_reduxx/models/user.dart';

class AppState {
  
  final User user;
  final bool isLoading;
  final String error;

  const AppState({
    @required this.user,
    @required this.isLoading,
    @required this.error,
  });

  AppState.initialState() : user = User.init(), isLoading = false, error = '';

}
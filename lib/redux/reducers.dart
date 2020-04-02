import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'app_state.dart';

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
    user: userReducers(state.user, action),
  );
}

User userReducers(User user, action) {

  switch (action) {
    case LoginUser:
      return User.init();
      break;

    case SaveUser:
      return User.init();
      break;

    default: return user;
  }

}
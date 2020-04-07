import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'app_state.dart';

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
    user: userReducers(state.user, action),
  );
}

User userReducers(User user, action) {

    if(action is LoginUser){
      return User.init();
    }

    if(action is SaveUser){
      return action.user;
    }

    if(action is LogoutUser){
      return User.init();
    }

    return User.init();
    

}
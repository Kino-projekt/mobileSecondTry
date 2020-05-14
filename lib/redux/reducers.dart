import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'app_state.dart';

AppState appStateReducer(AppState state, dynamic action) {
  var newState =  userReducers(action, state);
  return AppState(user: newState.user, isLoading: newState.isLoading, error: newState.error);
}

AppState userReducers(action, state) {

    if(action is LoginUser){
      return AppState(user: state.user, isLoading: state.isLoading, error: state.error);
    }

    if(action is LoginStart){
      return AppState(user: state.user, isLoading: true, error: '');
    }

    if(action is LoginSuccess){
      return AppState(user: action.user, isLoading: false, error: '');
    }

    if(action is LoginError){
      return AppState(user: User.init(), isLoading: false, error: action.error);
    }

    if(action is LogoutStart){
      return AppState(user: User.init(), isLoading: false, error: '');
    }

    if(action is LoadingFromDBSuccess){
      return AppState(user: User.init(), isLoading: false, error: '', films: action.films, articles: action.articles);
    }


    return AppState.initialState();
    

}
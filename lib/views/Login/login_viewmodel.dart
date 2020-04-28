import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:redux/redux.dart';

class LoginViewModel{

  final Function(Auth auth) loginUser;
  final User user;
  final bool isLoading;
  final String error;

  LoginViewModel({this.loginUser, this.user, this.isLoading, this.error});

  static LoginViewModel fromStore(Store<AppState> store){
    return LoginViewModel(
    loginUser: (Auth auth) {
        return store.dispatch(LoginUser(auth: auth));
      },
      user: store.state.user,
      isLoading: store.state.isLoading,
      error: store.state.error
    );
  }

  factory LoginViewModel.create(Store<AppState> store) {

    _login(Auth auth) {
      return store.dispatch(LoginUser(auth: auth));
    }

    return LoginViewModel(
      loginUser: _login,
      user: store.state.user,
      isLoading: store.state.isLoading,
      error: store.state.error
    );
  }

}
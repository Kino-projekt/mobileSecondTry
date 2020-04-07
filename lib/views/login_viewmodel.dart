import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:redux/redux.dart';

class LoginViewModel{

  final Function(Auth auth) login;

  LoginViewModel({this.login});

  static LoginViewModel fromStore(Store<AppState> store){
    return LoginViewModel(
      login: (Auth auth) {
        store.dispatch(new LoginUser(auth: auth));
      },
    );
  }

  factory LoginViewModel.create(Store<AppState> store) {

    _login(Auth auth) {
      store.dispatch(LoginUser(auth: auth));
    }

    return LoginViewModel(
      login: _login
    );
  }

}
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:redux/redux.dart';

class LoginViewModel{

  final Future Function(Auth auth) login;
  final User user;

  LoginViewModel({this.login, this.user});

  static LoginViewModel fromStore(Store<AppState> store){
    return LoginViewModel(
    login: (Auth auth) async {
        return store.dispatch(LoginUser(auth: auth));
      },
      user: store.state.user,
    );
  }

  factory LoginViewModel.create(Store<AppState> store) {

    Future _login(Auth auth) async {
      return store.dispatch(LoginUser(auth: auth));
    }

    return LoginViewModel(
      login: _login,
      user: store.state.user,
    );
  }

}
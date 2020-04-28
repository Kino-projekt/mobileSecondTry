import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:redux/redux.dart';

class DrawerViewModel{

  final User user;
  final Function() logoutUser;

  DrawerViewModel({this.user, this.logoutUser});

  static DrawerViewModel fromStore(Store<AppState> store){
    return DrawerViewModel(
      logoutUser: () {
        return store.dispatch(LogoutStart());
      },
      user: store.state.user,
    );
  }

  factory DrawerViewModel.create(Store<AppState> store) {
    return DrawerViewModel(
      user: store.state.user,
      logoutUser: () {
        return store.dispatch(LogoutStart());
      },
    );
  }

}
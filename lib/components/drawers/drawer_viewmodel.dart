import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:redux/redux.dart';

class DrawerViewModel{

  final User user;
  final Function() logoutUser;

  DrawerViewModel({this.user, this.logoutUser});

  static DrawerViewModel fromStore(Store<AppState> store){
    return DrawerViewModel(
      // logoutUser: () {
      //   return store.dispatch(LogoutStart());
      // },
      user: store.state.loginState.user,
    );
  }

  factory DrawerViewModel.create(Store<AppState> store) {
    return DrawerViewModel(
      user: store.state.loginState.user,
      // logoutUser: () {
      //   return store.dispatch(LogoutStart());
      // },
    );
  }

}
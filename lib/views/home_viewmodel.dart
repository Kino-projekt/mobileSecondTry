import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:redux/redux.dart';

class HomeViewModel{

  final User user;

  HomeViewModel({this.user});

  static HomeViewModel fromStore(Store<AppState> store){
    return HomeViewModel(
      user: store.state.user,
    );
  }

  factory HomeViewModel.create(Store<AppState> store) {


    return HomeViewModel(
      user: store.state.user,
    );
  }

}
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:redux/redux.dart';

class HomeViewModel{

  final User user;
  final bool isLoading;
  final String error;

  HomeViewModel({this.user, this.isLoading, this.error});

  static HomeViewModel fromStore(Store<AppState> store){
    return HomeViewModel(
      user: store.state.user,
      isLoading: store.state.isLoading,
      error: store.state.error,
    );
  }

  factory HomeViewModel.create(Store<AppState> store) {
    return HomeViewModel(
      user: store.state.user,
      isLoading: store.state.isLoading,
      error: store.state.error,
    );
  }

}
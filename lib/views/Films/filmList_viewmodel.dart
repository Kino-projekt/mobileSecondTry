import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:redux/redux.dart';

class FilmListViewModel{

  final User user;
  final bool isLoading;
  final String error;
  final List films;
  final List articles;

  FilmListViewModel({this.user, this.isLoading, this.error, this.articles, this.films});

  static FilmListViewModel fromStore(Store<AppState> store){
    return FilmListViewModel(
      user: store.state.user,
      isLoading: store.state.isLoading,
      error: store.state.error,
      films: store.state.films,
      articles: store.state.articles
    );
  }

  factory FilmListViewModel.create(Store<AppState> store) {
    return FilmListViewModel(
      user: store.state.user,
      isLoading: store.state.isLoading,
      error: store.state.error,
      films: store.state.films,
      articles: store.state.articles
    );
  }

}
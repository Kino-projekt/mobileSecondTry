import 'package:flutter_reduxx/redux/films/films_actions.dart';
import 'package:flutter_reduxx/redux/films/films_state.dart';

filmsReducer(FilmsState prevState, SetFilmsStateAction action) {
  final payload = action.filmsState;
  return prevState.copyWith(isError: payload.isError, isLoading: payload.isLoading, isSuccess: payload.isSuccess, films: payload.films);
}
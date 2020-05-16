import 'package:flutter_reduxx/redux/initial/initial_actions.dart';
import 'package:flutter_reduxx/redux/initial/initial_state.dart';

initialReducer(InitialState prevState, SetInitialStateAction action) {
  final payload = action.initialState;
  return prevState.copyWith(isError: payload.isError, isLoading: payload.isLoading, isSuccess: payload.isSuccess, articles: payload.articles, films: payload.films);
}
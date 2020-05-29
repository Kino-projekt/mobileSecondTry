import 'package:flutter_reduxx/redux/articles/articles_actions.dart';
import 'package:flutter_reduxx/redux/articles/articles_state.dart';

articlesReducer(ArticlesState prevState, SetArticlesStateAction action) {
  final payload = action.initialState;
  return prevState.copyWith(isError: payload.isError, isLoading: payload.isLoading, isSuccess: payload.isSuccess, articles: payload.articles);
}
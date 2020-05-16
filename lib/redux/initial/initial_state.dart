import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:meta/meta.dart';

@immutable
class InitialState {
  final bool isError;
  final bool isLoading;
  final bool isSuccess;
  final List<Article> articles;
  final List<Film> films;

  const InitialState({ this.isError, this.isLoading, this.isSuccess, this.films, this.articles });

  factory InitialState.initial() => InitialState(
        isLoading: false,
        isError: false,
        isSuccess: false,
        articles: null,
        films: null
      );

  InitialState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required bool isSuccess,
    @required List<Article> articles,
    @required List<Film> films,
  }) {
    return InitialState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      articles: articles ?? this.articles,
      films: films ?? this.films,
    );
  }
}
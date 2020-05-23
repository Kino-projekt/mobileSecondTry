import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/models/showing.dart';
import 'package:meta/meta.dart';

@immutable
class InitialState {
  final bool isError;
  final bool isLoading;
  final bool isSuccess;
  final List<Article> articles;
  final List<Film> films;
  final List<Showing> shows;

  const InitialState({ this.isError, this.isLoading, this.isSuccess, this.films, this.articles, this.shows });

  factory InitialState.initial() => InitialState(
        isLoading: false,
        isError: false,
        isSuccess: false,
        articles: null,
        films: null,
        shows: null
      );

  InitialState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required bool isSuccess,
    @required List<Article> articles,
    @required List<Film> films,
    @required List<Showing> shows,
  }) {
    return InitialState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      articles: articles ?? this.articles,
      films: films ?? this.films,
      shows: shows ?? this.shows,
    );
  }
}
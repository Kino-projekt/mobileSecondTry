import 'package:flutter_reduxx/models/film.dart';
import 'package:meta/meta.dart';

@immutable
class FilmsState {
  final bool isError;
  final bool isLoading;
  final bool isSuccess;
  final List<Film> films;

  const FilmsState({ this.isError, this.isLoading, this.isSuccess, this.films });

  factory FilmsState.initial() => FilmsState(
        isLoading: false,
        isError: false,
        isSuccess: false,
        films: null,
      );

  FilmsState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required bool isSuccess,
    @required List<Film> films,
  }) {
    return FilmsState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      films: films ?? this.films,
    );
  }
}
import 'package:flutter_reduxx/models/seance.dart';
import 'package:meta/meta.dart';

@immutable
class SeancesState {
  final bool isError;
  final bool isLoading;
  final bool isSuccess;
  final List<Seance> seances;

  const SeancesState({ this.isError, this.isLoading, this.isSuccess, this.seances });

  factory SeancesState.initial() => SeancesState(
        isLoading: false,
        isError: false,
        isSuccess: false,
        seances: null,
      );

  SeancesState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required bool isSuccess,
    @required List<Seance> seances,
  }) {
    return SeancesState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      seances: seances ?? this.seances,
    );
  }
}
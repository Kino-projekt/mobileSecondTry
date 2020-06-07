import 'package:flutter_reduxx/models/hall.dart';
import 'package:meta/meta.dart';

@immutable
class HallsState {
  final bool isError;
  final bool isLoading;
  final bool isSuccess;
  final List<Hall> halls;

  const HallsState({ this.isError, this.isLoading, this.isSuccess, this.halls });

  factory HallsState.initial() => HallsState(
        isLoading: false,
        isError: false,
        isSuccess: false,
        halls: null,
      );

  HallsState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required bool isSuccess,
    @required List<Hall> halls,
  }) {
    return HallsState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      halls: halls ?? this.halls,
    );
  }
}
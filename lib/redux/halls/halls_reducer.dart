import 'package:flutter_reduxx/redux/halls/halls_actions.dart';
import 'package:flutter_reduxx/redux/halls/halls_state.dart';

hallsReducer(HallsState prevState, SetHallsStateAction action) {
  final payload = action.hallsState;
  return prevState.copyWith(isError: payload.isError, isLoading: payload.isLoading, isSuccess: payload.isSuccess, halls: payload.halls);
}
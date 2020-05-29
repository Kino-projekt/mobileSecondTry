import 'package:flutter_reduxx/redux/seances/seances_actions.dart';
import 'package:flutter_reduxx/redux/seances/seances_state.dart';

seancesReducer(SeancesState prevState, SetSeancesStateAction action) {
  final payload = action.seancesState;
  return prevState.copyWith(isError: payload.isError, isLoading: payload.isLoading, isSuccess: payload.isSuccess, seances: payload.seances);
}
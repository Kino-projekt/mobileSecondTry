import 'package:flutter_reduxx/redux/register/register_actions.dart';
import 'package:flutter_reduxx/redux/register/register_state.dart';

registerReducer(RegisterState prevState, SetRegisterStateAction action) {
  final payload = action.registerState;
  return prevState.copyWith(isError: payload.isError, isLoading: payload.isLoading, isSuccess: payload.isSuccess);
}
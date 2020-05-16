import 'package:meta/meta.dart';

@immutable
class RegisterState {
  final bool isError;
  final bool isLoading;
  final bool isSuccess;

  const RegisterState({ this.isError, this.isLoading, this.isSuccess });

  factory RegisterState.initial() => RegisterState(
        isLoading: false,
        isError: false,
        isSuccess: false,
      );

  RegisterState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required bool isSuccess,
  }) {
    return RegisterState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
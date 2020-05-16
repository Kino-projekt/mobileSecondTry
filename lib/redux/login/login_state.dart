import 'package:flutter_reduxx/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class LoginState {
  final bool isError;
  final bool isLoading;
  final User user;

  const LoginState({ this.isError, this.isLoading, this.user });

  factory LoginState.initial() => LoginState(
        isLoading: false,
        isError: false,
        user: User.init(),
      );

  LoginState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required User user,
  }) {
    return LoginState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}
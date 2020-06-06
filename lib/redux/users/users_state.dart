import 'package:flutter_reduxx/models/user.dart';
import 'package:meta/meta.dart';

@immutable
class UsersState {
  final bool isError;
  final bool isLoading;
  final bool isSuccess;
  final List<User> users;

  const UsersState({ this.isError, this.isLoading, this.isSuccess, this.users });

  factory UsersState.initial() => UsersState(
        isLoading: false,
        isError: false,
        isSuccess: false,
        users: null,
      );

  UsersState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required bool isSuccess,
    @required List<User> users,
  }) {
    return UsersState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      users: users ?? this.users,
    );
  }
}
part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool userExists;
  final User? user;

  const UserState({
    this.userExists = false,
    this.user,
  });
}

class InitialUserState extends UserState {}

class UserSetState extends UserState {
  const UserSetState(User user) : super(user: user, userExists: true);
}

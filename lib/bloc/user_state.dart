part of 'user_cubit.dart';

abstract class UserState {}

class UserInitial extends UserState {
  bool existsUser = false;
}

class UserActive extends UserState {
  bool existsUser = true;
  final User user;

  UserActive(this.user);
}

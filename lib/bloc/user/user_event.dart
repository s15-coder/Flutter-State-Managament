part of 'user_bloc.dart';

abstract class UserEvent {}

class EnableUserEvent extends UserEvent {
  final User user;
  EnableUserEvent(this.user);
}

class ChangeUserAgeEvent extends UserEvent {
  final int age;
  ChangeUserAgeEvent(this.age);
}

class AddProfessionEvent extends UserEvent {}

class DeleteUserEvent extends UserEvent {}

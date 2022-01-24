import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_management/models/user.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialUserState()) {
    on<EnableUserEvent>((event, emit) {
      emit(UserSetState(event.user));
    });
    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.userExists) return;
      final newUser = state.user!.copyWith(age: event.age);
      emit(UserSetState(newUser));
    });
    on<AddProfessionEvent>((event, emit) {
      if (!state.userExists) return;
      final newUser = state.user!.copyWith(professions: [
        ...state.user!.professions,
        "Profession: ${state.user!.professions.length}"
      ]);
      emit(UserSetState(newUser));
    });
    on<DeleteUserEvent>((event, emit) => emit(InitialUserState()));
  }
}

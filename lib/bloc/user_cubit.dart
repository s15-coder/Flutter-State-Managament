import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_management/models/user.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void setNewUser(User user) {
    emit(UserActive(user));
  }

  void setAge(int age) {
    final currentState = state;
    if (currentState is UserActive) {
      final user = currentState.user.copyWith(age: age);
      emit(UserActive(user));
    }
  }

  void addProfession() {
    final currentState = state;
    if (currentState is UserActive) {
      List<String> newProfessions = [
        ...currentState.user.profesions,
        "Profesion: ${currentState.user.profesions.length + 1}"
      ];
      final user = currentState.user.copyWith(profesions: newProfessions);
      emit(UserActive(user));
    }
  }

  void deleteUser() {
    emit(UserInitial());
  }
}

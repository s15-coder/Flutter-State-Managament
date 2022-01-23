import 'dart:async';

import 'package:singleton_state_management/models/user.dart';

class _UserService {
  User? _user;

  User? get user => _user;
  final _userStreamController = StreamController<User?>.broadcast();

  Stream<User?> get userStream => _userStreamController.stream;

  bool get isThereAnyUser => _user != null;

  void loadUser(User user) {
    _user = user;
    _userStreamController.sink.add(_user);
  }

  void updateUserAge(int age) {
    _user!.age = age;
    _userStreamController.sink.add(_user);
  }
}

final userService = _UserService();

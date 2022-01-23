import 'package:flutter/cupertino.dart';
import 'package:singleton_state_management/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User? get user => _user;

  bool get userExists => _user != null;

  set user(User? userArg) {
    _user = userArg;
    notifyListeners();
  }

  void setAge(int age) {
    if (_user == null) return;
    _user!.age = age;
    notifyListeners();
  }

  void deleteUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession() {
    _user!.profesions.add('Profesion: ${_user!.profesions.length}');
    notifyListeners();
  }
}

import 'package:get/get.dart';
import 'package:singleton_state_management/models/user.dart';

class UserController extends GetxController {
  var existsUser = false.obs;
  var user = User().obs;
  void loadUser(User userParam) {
    user.value = userParam;
    existsUser.value = true;
  }

  void changeAge(int age) {
    user.update((val) => val!.age = age);
  }

  void addProfession(String profession) => user.update((val) {
        val!.profesions = [
          ...val.profesions,
          profession,
        ];
      });

  int get professionsCount => user.value.profesions.length;
}

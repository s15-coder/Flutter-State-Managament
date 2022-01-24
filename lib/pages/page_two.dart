import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_state_management/controllers/user_controller.dart';
import 'package:singleton_state_management/models/user.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);
  static const routeName = '/PageTwo';

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Scaffold(
        appBar: AppBar(
          title: Text('PageTwo'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  child: const Text(
                    'Establecer usuario',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    userController.loadUser(User(
                      name: 'Esteban',
                      age: 20,
                    ));
                    Get.snackbar('User created!', 'The username is Esteban',
                        backgroundColor: Colors.white,
                        boxShadows: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                          )
                        ]);
                  }),
              MaterialButton(
                child: const Text(
                  'Establecer edad',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () => userController.changeAge(25),
              ),
              MaterialButton(
                child: const Text(
                  'Establecer profesiones',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () => userController.addProfession(
                    'Profession: #${userController.professionsCount + 1}'),
              ),
              MaterialButton(
                child: const Text(
                  'Change theme',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
              ),
            ],
          ),
        ));
  }
}

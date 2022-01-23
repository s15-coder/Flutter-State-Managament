import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_state_management/models/user.dart';
import 'package:singleton_state_management/services/user_service.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);
  static const routeName = 'PageTwo';

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
        appBar: AppBar(
          title:
              Text(userService.userExists ? userService.user!.name : 'PageTwo'),
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
                  final newUser = User(name: "Esteban", age: 25);
                  newUser.profesions = [
                    'Android Developer',
                    'FrontEnd developer'
                  ];
                  userService.user = newUser;
                },
              ),
              MaterialButton(
                child: const Text(
                  'Establecer edad',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () {
                  userService.setAge(40);
                },
              ),
              MaterialButton(
                child: const Text(
                  'Establecer profesiones',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () => userService.addProfession(),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:singleton_state_management/models/user.dart';
import 'package:singleton_state_management/services/user_service.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);
  static const routeName = 'PageTwo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
              stream: userService.userStream,
              initialData: userService.user,
              builder: (_, AsyncSnapshot<User?> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Text(snapshot.data!.name);
                }
                return const Text('PageTwo');
              }),
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
                  userService.loadUser(newUser);
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
                  userService.updateUserAge(19);
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
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}

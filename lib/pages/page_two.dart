import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_management/bloc/user_cubit.dart';
import 'package:singleton_state_management/models/user.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);
  static const routeName = 'PageTwo';

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
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
                  final newUser = User(age: 25, name: "Esteban");
                  userCubit.setNewUser(newUser);
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
                onPressed: () => userCubit.setAge(40),
              ),
              MaterialButton(
                child: const Text(
                  'Establecer profesiones',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () => userCubit.addProfession(),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_management/bloc/user/user_bloc.dart';
import 'package:singleton_state_management/models/user.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);
  static const routeName = 'PageTwo';

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('PageTwo'),
        ),
        body: SizedBox(
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
                  final newUser = User(
                      name: "Esteban",
                      age: 20,
                      professions: ['Android Developer']);
                  userBloc.add(EnableUserEvent(newUser));
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
                onPressed: () => userBloc.add(ChangeUserAgeEvent(15)),
              ),
              MaterialButton(
                child: const Text(
                  'Establecer profesiones',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () => userBloc.add(AddProfessionEvent()),
              ),
            ],
          ),
        ));
  }
}

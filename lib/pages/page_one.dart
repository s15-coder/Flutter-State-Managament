import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_management/bloc/user/user_bloc.dart';
import 'package:singleton_state_management/models/user.dart';
import 'package:singleton_state_management/pages/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);
  static const routeName = 'PageOne';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageOne'),
        actions: [
          IconButton(
              onPressed: () =>
                  BlocProvider.of<UserBloc>(context).add(DeleteUserEvent()),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.userExists
              ? UserInfo(user: state.user!)
              : const Center(
                  child: Text("There is not any user"),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, PageTwo.routeName),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          const Divider(),
          ListTile(title: Text('Nombre: ${user.name}')),
          ListTile(title: Text('Edad: ${user.age}')),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          ...user.professions
              .map((prof) => ListTile(
                    title: Text(prof),
                  ))
              .toList()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_management/bloc/user_cubit.dart';
import 'package:singleton_state_management/models/user.dart';
import 'package:singleton_state_management/pages/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);
  static const routeName = 'PageOne';
  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageOne'),
        actions: [
          IconButton(
              onPressed: () => userCubit.deleteUser(),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: const _BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, PageTwo.routeName),
      ),
    );
  }
}

class _BodyScaffold extends StatelessWidget {
  const _BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UserInitial:
            return const Center(
              child: Text('There is not user.'),
            );
          case UserActive:
            return UserInfo((state as UserActive).user);

          default:
            return const Center(
              child: Text('There is not user.'),
            );
        }
      },
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo(this.user);
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
          const Divider(),
          ...user.profesions
              .map((p) => ListTile(
                    title: Text(p),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

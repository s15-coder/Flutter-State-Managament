import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_state_management/models/user.dart';
import 'package:singleton_state_management/pages/page_two.dart';
import 'package:singleton_state_management/services/user_service.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);
  static const routeName = 'PageOne';
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => userService.deleteUser(),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        title: const Text('PageOne'),
      ),
      body: userService.userExists
          ? UserInfo(user: userService.user!)
          : const Center(
              child: Text('There is not any user'),
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
          const Divider(),
          ...user.profesions
              .map((p) => ListTile(
                    title: Text(p),
                  ))
              .toList()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:singleton_state_management/models/user.dart';
import 'package:singleton_state_management/pages/page_two.dart';
import 'package:singleton_state_management/services/user_service.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);
  static const routeName = 'PageOne';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageOne'),
      ),
      body: StreamBuilder(
          stream: userService.userStream,
          builder: (_, AsyncSnapshot<User?> snap) {
            if (snap.hasData && snap.data != null) {
              return UserInfo(
                user: snap.data!,
              );
            }
            return const Center(child: Text('There is not available user'));
          }),
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
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          Divider(),
          ListTile(title: Text('Nombre: ${user.name}')),
          ListTile(title: Text('Edad: ${user.age}')),
          Text(
            'Profesiones',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Profesión 1'),
          ),
          ListTile(
            title: Text('Profesión 1'),
          ),
          ListTile(
            title: Text('Profesión 1'),
          ),
        ],
      ),
    );
  }
}

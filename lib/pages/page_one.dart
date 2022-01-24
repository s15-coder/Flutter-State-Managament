import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_state_management/controllers/user_controller.dart';
import 'package:singleton_state_management/models/user.dart';
import 'package:singleton_state_management/pages/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);
  static const routeName = '/pageOne';
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PageOne'),
      ),
      body: Obx(() => userController.existsUser.value
          ? UserInfo(user: userController.user.value)
          : const Center(
              child: Text('There is not user.'),
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(PageTwo.routeName),
        // onPressed: () => Navigator.pushNamed(context, PageTwo.routeName),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);
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
          ...user.profesions
              .map((pro) => ListTile(
                    title: Text(pro),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

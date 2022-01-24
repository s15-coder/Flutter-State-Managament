import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_state_management/pages/page_one.dart';
import 'package:singleton_state_management/pages/page_two.dart';

import 'controllers/user_controller.dart';

void main() {
  final userController = Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: PageOne.routeName,
      // routes: {
      //   PageOne.routeName: (_) => PageOne(),
      //   PageTwo.routeName: (_) => PageTwo(),
      // },
      getPages: [
        GetPage(
          name: PageOne.routeName,
          page: () => const PageOne(),
        ),
        GetPage(
          name: PageTwo.routeName,
          page: () => const PageTwo(),
        ),
      ],
    );
  }
}

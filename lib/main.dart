import 'package:flutter/material.dart';
import 'package:singleton_state_management/pages/page_one.dart';
import 'package:singleton_state_management/pages/page_two.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: PageOne.routeName,
      routes: {
        PageOne.routeName: (_) => PageOne(),
        PageTwo.routeName: (_) => PageTwo(),
      },
    );
  }
}

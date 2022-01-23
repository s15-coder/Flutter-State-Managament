import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_state_management/pages/page_one.dart';
import 'package:singleton_state_management/pages/page_two.dart';
import 'package:singleton_state_management/services/user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: PageOne.routeName,
        routes: {
          PageOne.routeName: (_) => PageOne(),
          PageTwo.routeName: (_) => PageTwo(),
        },
      ),
    );
  }
}

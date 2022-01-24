import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_management/bloc/user/user_bloc.dart';
import 'package:singleton_state_management/pages/page_one.dart';
import 'package:singleton_state_management/pages/page_two.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: PageOne.routeName,
        routes: {
          PageOne.routeName: (_) => const PageOne(),
          PageTwo.routeName: (_) => const PageTwo(),
        },
      ),
    );
  }
}

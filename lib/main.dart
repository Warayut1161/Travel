import 'package:flutter/material.dart';
import 'package:login/router.dart';
import 'package:login/widget/authen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
       debugShowCheckedModeBanner: false,
      initialRoute: '/authen',
      

    );
  }
}


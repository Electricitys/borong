import 'package:borong/routes.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Borong',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
        primaryColor: ContraColors.persianBlue,
      ),
      routes: Routes.getRoute(),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:milvik_project/widgets/splash.dart';

import 'view/details/continue_with_phone.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO : add country code prefix
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doctor Profile Management Application',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.lightBlue.shade900,
        ),
        home: Splash());
  }
}

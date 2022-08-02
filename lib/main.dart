
import 'package:flutter/material.dart';
import 'package:milvik_project/view/screens/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doctor Profile Management Application',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.lightBlue.shade900,
        ),
        home: const SplashScreen());
  }
}

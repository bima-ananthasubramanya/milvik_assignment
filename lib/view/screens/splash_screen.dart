import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milvik_project/cubit/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enter_phoneNumber_screen.dart';
import 'home_screen_doctor_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Image.asset('images/img_bima_logo_nav_blue_56dp.png'),
        ),
      ),
    );
  }

  void navigateUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var phoneNumber = prefs.getInt('phone Number');
    runApp(BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: MaterialApp(
          home: phoneNumber == null ? EnterPhoneNumber() : const HomeScreen()),
    ));
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser();
    });
  }
}

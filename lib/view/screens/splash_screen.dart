

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enter_phoneNumber_screen.dart';
import 'home_screen_doctor_list.dart';



class SplashScreen extends StatefulWidget  {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
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

  void navigateUser() async{
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var phoneNumber = prefs.getInt('phone Number');
    print(phoneNumber);
    runApp(MaterialApp(home: phoneNumber == null ? ContinueWithPhone() : const HomeScreen()));

  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser();});
    }
}

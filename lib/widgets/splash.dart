

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/details/continue_with_phone.dart';
import '../view/home_screen/home_screen_doctor_list.dart';

class Splash extends StatefulWidget  {



  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
    runApp(MaterialApp(home: phoneNumber == null ? ContinueWithPhone() : HomeScreen()));

  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser();});
    }
}

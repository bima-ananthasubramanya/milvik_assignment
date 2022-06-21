

import 'package:flutter/material.dart';

import '../view/details/continue_with_phone.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    navigateToLogin();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Image.asset('/Users/milvik/StudioProjects/milvik_assignment/images/img_bima_logo_nav_blue_56dp.png'),
        ),
      ),
    );
  }

  void navigateToLogin() async{
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContinueWithPhone()));
  }
}

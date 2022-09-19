// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../cubit/auth_cubit.dart';
import 'validate_otp_screen.dart';

class EnterPhoneNumber extends StatelessWidget {
  EnterPhoneNumber({Key? key}) : super(key: key);

  var phoneNumberController = TextEditingController();

  String phoneNumber = '+919986975481';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade900,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 200,
              // color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'ENTER YOUR MOBILE NUMBER',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.white,
                      // prefix: Padding(
                      //   padding: EdgeInsets.all(4),
                      //   child: Text(
                      //     '+91',
                      //     style: TextStyle(color: Colors.yellow),
                      //   ),
                      // ),
                      suffixIcon: IconButton(
                        onPressed: phoneNumberController.clear,
                        icon: Icon(
                          Icons.clear,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'We will send you an SMS with the verification code to this number',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'RobotoCondensed'),
                  ),
                ],
              ),
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthCodeSentState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EnterOtp(phoneNumber: phoneNumber)));
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  width: double.infinity,
                  // padding: EdgeInsets.all(value),
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            // side: BorderSide(color: Colors.yellow),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.teal),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                    onPressed: () async {
                      if (phoneNumberController.text == phoneNumber) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setInt('phone Number',
                            int.parse(phoneNumberController.text));
                        BlocProvider.of<AuthCubit>(context)
                            .sendOTP(phoneNumber);
                      } else {
                        if (kDebugMode) {
                          print('Please enter the correct Phone Number ');
                        }
                      }
                    },
                    child: Text(
                      'Send OTP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // fontFamily: 'RobotoCondensed'
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

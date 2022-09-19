// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milvik_project/cubit/auth_cubit.dart';

import 'home_screen_doctor_list.dart';

class EnterOtp extends StatefulWidget {
  String phoneNumber = '';

  EnterOtp({
    Key? key,
    required String phoneNumber,
  }) : super(key: key) {
    if (kDebugMode) {
      print('Received Phone number: $phoneNumber');
    }
    this.phoneNumber = phoneNumber;
  }

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  var otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade900,
      body: SafeArea(
        child: Container(
          // color: Colors.white,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                // color: Colors.teal,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Enter Verification Code',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        cursorColor: Colors.yellow,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: otpController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        'Please enter the verification code that was sent to ${widget.phoneNumber}',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedInState) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10))),
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .verifyOTP(otpController.text);
                      },
                      child: Text(
                        'Login',
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
              ),
              // CheckboxListTile(
            ],
          ),
        ),
      ),
    );
  }

  textFieldOTP({required bool first, last}) {
    return SizedBox(
      height: 60,
      child: AspectRatio(
        aspectRatio: 0.75,
        child: TextField(
          cursorColor: Colors.yellow,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.yellow),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlue.shade900),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlue.shade900),
            ),
            // enabled: false,
            filled: true,
            fillColor: Colors.lightBlue.shade800,
            // focusColor: Colors.blue.shade900,
            counter: Offstage(),
            // enabledBorder: OutlineInputBorder(
            //   // borderSide: BorderSide(width: 2, color: Colors.yellow),
            //   borderRadius: BorderRadius.circular(5),
            // ),
          ),
        ),
      ),
    );
  }
}

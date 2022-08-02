// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'home_screen_doctor_list.dart';



class VerifyPhone extends StatefulWidget {
  String phoneNumber = '';
  VerifyPhone({Key? key, required String phoneNumber}) : super(key: key) {
    print('Received Phone number: $phoneNumber');
    this.phoneNumber = phoneNumber;
  }
  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  var otpController = TextEditingController();
  String otp = '123456';
  String code = '';
  final bool _value = false;
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
              Container(
                // color: Colors.teal,
                height: 150,
                child: Column(
                  children: [
                    Text(
                      'Enter Verification Code',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          textFieldOTP(first: true, last: false),
                          textFieldOTP(first: false, last: false),
                          textFieldOTP(first: false, last: false),
                          textFieldOTP(first: false, last: false),
                          textFieldOTP(first: false, last: false),
                          textFieldOTP(first: false, last: true),
                        ],
                      ),
                    ),
                    Text(
                      'Please enter the verification code that was sent to ${widget.phoneNumber}',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoCondensed',
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
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
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    } ,

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
              ),
              // CheckboxListTile(
              //     title: Text(
              //       'I agree to the Terms of Use and Privacy Policy',
              //       style: TextStyle(color: Colors.white, fontSize: 15),
              //      ),
              //     controlAffinity: ListTileControlAffinity.leading,
              //     activeColor: Colors.teal,
              //     checkColor: Colors.white,
              //     value: _value,
              //     onChanged: (bool? value) {
              //       setState(() {
              //         _value = value!;
              //       });
              //     })
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

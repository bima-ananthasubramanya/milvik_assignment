// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'verify_phone.dart';

class ContinueWithPhone extends StatefulWidget {
  @override
  State<ContinueWithPhone> createState() => _ContinueWithPhoneState();
}

class _ContinueWithPhoneState extends State<ContinueWithPhone> {
  var phoneNumberController = TextEditingController();

  // void submitData() {
  //   final enteredPhoneNumber = phoneNumberController.text;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    // onSubmitted: (_) => submitData(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.white,
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
                      builder: (context) => VerifyPhone(
                        phoneNumber: phoneNumberController.text,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'RobotoCondensed'
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

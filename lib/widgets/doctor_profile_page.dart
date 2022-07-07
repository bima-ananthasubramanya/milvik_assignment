// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/doctor_details.dart';

class DoctorProfile extends StatefulWidget {
  String? firstName;
  String? lastName;
  String? contactNumber;
  DoctorProfile(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.contactNumber})
      : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900,
        // shape: CircularNotchedRectangle(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.yellow,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${widget.firstName!} ${widget.lastName!}',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    // width: double.infinity,
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
                      onPressed: () {},
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,

                          // fontFamily: 'RobotoCondensed'
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    // color: Colors.lightBlue,
                    height: 550,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PERSONAL DETAILS',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'),
                        ),
                        Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              'First Name'.toUpperCase(),
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              widget.firstName!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              'Last Name'.toUpperCase(),
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              widget.lastName!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              'Gender'.toUpperCase(),
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              'M/F',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              'Contact Number'.toUpperCase(),
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              widget.contactNumber!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                         SizedBox(
                          width: double.infinity,
                          height: 200,
                          // color: Colors.pink,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Date of Birth'.toUpperCase(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    )
                                    // margin: EdgeInsets.all(10),
                                    ,
                                    // color: Colors.white,
                                    height: 80,
                                    width: 90,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Day'),
                                        Text(
                                          'day',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    // margin: EdgeInsets.all(10),
                                    // color: Colors.white,
                                    height: 80,
                                    width: 90,

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Month'),
                                        Text(
                                          'month',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    // margin: EdgeInsets.all(10)
                                    // color: Colors.white,
                                    height: 80,
                                    width: 90,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Year'),
                                        Text(
                                          'year',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    // margin: EdgeInsets.all(10),
                                    // color: Colors.white,
                                    height: 80,
                                    width: 90,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Blood Group'.toUpperCase()),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    // margin: EdgeInsets.all(10),
                                    // color: Colors.white,
                                    height: 80,
                                    width: 90,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Height'.toUpperCase()),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    // margin: EdgeInsets.all(10),
                                    // color: Colors.white,
                                    height: 80,
                                    width: 90,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Weight'.toUpperCase()),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

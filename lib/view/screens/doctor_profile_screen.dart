

import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final String? contactNumber;
  const DoctorProfileScreen(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.contactNumber})
      : super(key: key);

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
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
          icon: const Icon(
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
                    style: const TextStyle(
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
                          padding: MaterialStateProperty.all(const EdgeInsets.all(10))),
                      onPressed: () {},
                      child: const Text(
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
                        const Text(
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
                              style: const TextStyle(
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
                              style: const TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              widget.lastName!,
                              style: const TextStyle(
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
                              style: const TextStyle(color: Colors.grey),
                            ),
                            subtitle: const Text(
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
                              style: const TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              widget.contactNumber!,
                              style: const TextStyle(
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
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Date of Birth'.toUpperCase(),
                                  style: const TextStyle(color: Colors.grey),
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
                                      children: const [
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
                                      children: const [
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
                                      children: const [
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



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milvik_project/view_model/doctor_list_vm.dart';
import 'package:provider/provider.dart';

import '../../models/doctor_details.dart';

import '../../response/status.dart';
import '../../widgets/doctor_profile_page.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/loading_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DoctorListVM viewModel = DoctorListVM();

  @override
  void initState() {
    viewModel.fetchDoctor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'BIMA DOCTOR',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.lightBlue.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.lightBlue.shade900,
          ),
          onPressed: () {},
        ),
        actions: [
          Container(
            width: 110,
            child: Image.asset('images/img_bima_logo_nav_blue_56dp.png'),
          )
        ],
      ),
      body: ChangeNotifierProvider<DoctorListVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<DoctorListVM>(builder: (context, viewModel, _) {
          switch (viewModel.doctorMain.status) {
            case Status.LOADING:
              print("LOADING");
              return LoadingWidget();
            case Status.ERROR:
              print("ERROR");
              return MyErrorWidget(viewModel.doctorMain.message ?? "NA");
            case Status.COMPLETED:
              print("COMPLETED");
              return getDoctorListView(viewModel.doctorMain.data);
            default:
          }
          return Container();
        }), 
      ),

    );
  }

  Widget  getDoctorListView(List<Doctor>? doctorsList) {
    return ListView.builder(
      itemCount: doctorsList?.length,
      itemBuilder: (context, position) {
        return getDoctorListItem(doctorsList![position]);
      },
    );
  }

  Widget getDoctorListItem(Doctor doctor) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                height: 60,
                width: 60,
                child: ClipOval(
                  // borderRadius: BorderRadius.circular(60),
                  child: Material(
                    child: FadeInImage(
                      placeholder: AssetImage('place_holder.png'),
                      image:
                      NetworkImage('${doctor.profile_pic}'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              title: Text(
                '${doctor.first_name}'.toUpperCase(),
                style: TextStyle(color: Colors.blue),
              ),
              // tileColor: Colors.lightBlue.shade900,
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${doctor.specialization}',
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  Text(
                    '${doctor.description}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ],
              ),
              // isThreeLine: true,
              // dense: true,
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.lightBlue.shade900,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DoctorProfile(
                            firstName: doctor.first_name,
                            lastName: doctor.last_name,
                            contactNumber: doctor.primary_contact_no,


                          ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:milvik_project/presenter/doctor_list_presenter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/doctor_details.dart';
import '../../presenter/doctor_list_presenter.dart';
import '../../response/status.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import 'enter_phoneNumber_screen.dart';
import 'doctor_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DoctorListPresenter presenter = DoctorListPresenter();

  @override
  void initState() {
    presenter.fetchDoctor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
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
        actions: [
          SizedBox(
            width: 110,
            child: Image.asset('images/img_bima_logo_nav_blue_56dp.png'),
          )
        ],
      ),
      body: ChangeNotifierProvider<DoctorListPresenter>(
        create: (BuildContext context) => presenter,
        child: Consumer<DoctorListPresenter>(builder: (context, presenter, _) {
          switch (presenter.doctorMain.status) {
            case Status.LOADING:
              print("LOADING");
              return const LoadingWidget();
            case Status.ERROR:
              if (kDebugMode) {
                print("ERROR");
              }
              return MyErrorWidget(presenter.doctorMain.message ?? "NA");
            case Status.COMPLETED:
              if (kDebugMode) {
                print("COMPLETED");
              }
              return getDoctorListView(presenter.doctorMain.data);
            default:
          }
          return Container();
        }),
      ),
    );
  }

   getDoctorListView(List<Doctor>? doctorsList)  {
    return ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, position)  {
          return   getDoctorListItem(doctorsList![position], context);
          // doctorsList?.length,
        });
  }

  Widget getDoctorListItem(Doctor doctor,  context)  {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                      placeholder: const AssetImage('place_holder.png'),
                      image: CachedNetworkImageProvider('${doctor.profile_pic}'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              title: Text(
                '${doctor.first_name}'.toUpperCase(),
                style: const TextStyle(color: Colors.blue),
              ),
              // tileColor: Colors.lightBlue.shade900,
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${doctor.specialization}',
                    style: const TextStyle(color: Colors.lightBlue),
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
                      builder: (context) => DoctorProfileScreen(
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

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
            ),
            child: const Text(
              'BIMA DOCTOR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              'Log Out',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                  fontFamily: 'Roboto',
                  fontSize: 20),
            ),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('phone Number');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContinueWithPhone()));
            },
          )
        ],
      ),
    );
  }
}

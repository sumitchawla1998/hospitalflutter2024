import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hmsbysumit/admin/AdminViewCancelAppointments.dart';
import 'package:hmsbysumit/admin/AdminViewConfirmAppointments.dart';
import 'package:hmsbysumit/admin/AdminViewDoctors.dart';
import 'package:hmsbysumit/admin/AdminViewPendingAppointments.dart';
import 'package:hmsbysumit/patient/PatientAppointmentStatus.dart';
import 'package:hmsbysumit/patient/PatientBookAppointment.dart';
import 'package:hmsbysumit/patient/PatientViewDoctors.dart';
import 'package:hmsbysumit/patient/PatientViewPrescription.dart';
import '../MainScreen.dart';
import '../admin/AdminAddDoctor.dart';
import '../admin/AdminDashboard.dart';
import 'MenuItemComponent.dart';
class DrawerComponent extends StatelessWidget {
  DrawerComponent({Key? key}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return user != null  ? MemberDrawer() : AdminDrawer();
  }
}

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff28b6f6),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xff28b6f6),),
              accountName: Text(
                "Welcome, Admin",
                style: TextStyle(fontSize: 16),
              ),
              accountEmail: Text(""),
              currentAccountPictureSize: Size.square(42),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person,size: 30,color: Color(0xff28b6f6),),
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ),
          // uid == null  ? Text("Admin"): Text("User"),
          MenuItemComponent(Icons.dashboard,"Dashboard",AdminDashboard(),Color(0xff28b6f6)),
          MenuItemComponent(Icons.person_add,"Add Doctor",AdminAddDoctor(),Color(0xff28b6f6)),
          MenuItemComponent(Icons.group,"View Doctors",AdminViewDoctors(),Color(0xff28b6f6)),
          // MenuItemComponent(Icons.add_box_rounded,"Add Equipment",AdminAddEquipment()),
          // MenuItemComponent(Icons.fitness_center,"View Equipments",AdminViewEquipments()),
          MenuItemComponent(Icons.pending,"Pending List",AdminViewPendingAppointments(),Color(0xff28b6f6)),
          MenuItemComponent(Icons.thumb_up,"Confirm List",AdminViewConfirmAppointments(),Color(0xff28b6f6)),
          MenuItemComponent(Icons.thumb_down,"Cancelled List",AdminViewCancelAppointments(),Color(0xff28b6f6)),
          MenuItemComponent(Icons.logout,"Logout",MainScreen(),Color(0xff28b6f6)),
          
        ],
      ),
    );
  }
}

class MemberDrawer extends StatelessWidget {
  MemberDrawer({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff28b6f6),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xff28b6f6),),
              accountName: Text(
                "Welcome, ${auth.currentUser!.displayName}",
                style: TextStyle(fontSize: 16),
              ),
              accountEmail: Text(""),
              currentAccountPictureSize: Size.square(42),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person,size: 30,color: Color(0xff28b6f6),),
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ),

          MenuItemComponent(Icons.today,"Book Appointment",PatientViewDoctors(),Color(0xff28b6f6)),
          MenuItemComponent(Icons.spatial_tracking,"Appointment Status",PatientAppointmentStatus(),Color(0xff28b6f6)),
          MenuItemComponent(Icons.today,"View Prescription",PatientViewPrescription(),Color(0xff28b6f6)),
          //
          // MenuItemComponent(Icons.check_circle,"Active Package",MemberActivePackage()),
          //

          //
          // MenuItemComponent(Icons.logout,"Logout",MainScreen())

          MenuItemComponent(Icons.logout,"Logout",MainScreen(),Color(0xff28b6f6)),


        ],
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmsbysumit/components/AppBarComponent.dart';
import 'package:hmsbysumit/components/ButtonComponent.dart';
import 'package:hmsbysumit/components/DashboardCard.dart';
import 'package:hmsbysumit/components/DrawerComponent.dart';
import 'package:hmsbysumit/components/DropdownComponent.dart';
import 'package:hmsbysumit/components/PasswordFieldComponent.dart';

import '../components/TextFieldComponent.dart';
import '../services/dashboardservice.dart';

class AdminDashboard extends StatefulWidget implements PreferredSizeWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboard();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _AdminDashboard extends State<AdminDashboard> {
  int tdoctors = 0;
  int tpatients = 0;

  int tpending = 0;
  int tconfirmed = 0;
  int tcancelled = 0;

  DashboardService dashboardService = DashboardService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showValues();

  }

  showValues()async {
    int doctors = await dashboardService.getCount("doctors");
    int patients = await dashboardService.getCount("patients");
    int pending = await dashboardService.getCount("appointments","Pending");
    int confirmed = await dashboardService.getCount("appointments","Confirmed");
    int cancelled = await dashboardService.getCount("appointments","Cancelled");

    setState(() {
      tdoctors = doctors;
      tpatients = patients;

      tpending = pending;
      tconfirmed = confirmed;
      tcancelled = cancelled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
        appBar: AppBarComponent("Dashboard"),
        backgroundColor: Color(0xffffffff),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 100,left: 30,right: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DashboardCardComponent(Icons.person, "Doctors", tdoctors, Color(0xff28b6f6)),
                DashboardCardComponent(Icons.group, "Patients", tpatients, Color(0xff1a3d7d)),
                DashboardCardComponent(Icons.pending, "Pending", tpending, Color(0xff28b6f6)),
                DashboardCardComponent(Icons.thumb_up, "Confirmed", tconfirmed, Color(0xff1a3d7d)),
                DashboardCardComponent(Icons.thumb_down, "Cancelled", tcancelled, Color(0xff28b6f6)),


              ],
            ),
          ),
        ));
  }
}

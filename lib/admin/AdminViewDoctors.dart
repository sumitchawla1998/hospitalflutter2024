import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hmsbysumit/components/DoctorCardComponent.dart';
import 'package:hmsbysumit/components/DrawerComponent.dart';

import '../components/AppBarComponent.dart';
import '../models/doctormodel.dart';
class AdminViewDoctors extends StatefulWidget {
  const AdminViewDoctors({Key? key}) : super(key: key);

  @override
  State<AdminViewDoctors> createState() => _AdminViewDoctorsState();
}

class _AdminViewDoctorsState extends State<AdminViewDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
        backgroundColor: Color(0xffffffff),
        appBar: AppBarComponent("View Doctors"),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("doctors").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      if (snapshot.data?.docs.length > 0) {
                        DoctorModel doctor =
                        DoctorModel.fromJson(snapshot.data?.docs[index]);
                        return DoctorCardComponent(doctor);
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            );
          },
        ));

  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hmsbysumit/components/DrawerComponent.dart';

import '../components/AppBarComponent.dart';
import '../components/DoctorCardComponent.dart';
import '../models/doctormodel.dart';
class PatientViewDoctors extends StatefulWidget {
  const PatientViewDoctors({Key? key}) : super(key: key);

  @override
  State<PatientViewDoctors> createState() => _PatientViewDoctorsState();
}

class _PatientViewDoctorsState extends State<PatientViewDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
        backgroundColor: Color(0xffffffff),
        appBar: AppBarComponent("Book Appointment"),
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

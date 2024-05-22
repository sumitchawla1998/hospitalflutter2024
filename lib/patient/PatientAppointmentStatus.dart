import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hmsbysumit/components/DrawerComponent.dart';

import '../components/AppBarComponent.dart';
import '../components/AppointmentStatusCard.dart';
import '../models/appointmentmodel.dart';
class PatientAppointmentStatus extends StatefulWidget {
  const PatientAppointmentStatus({Key? key}) : super(key: key);

  @override
  State<PatientAppointmentStatus> createState() => _PatientAppointmentStatusState();
}

class _PatientAppointmentStatusState extends State<PatientAppointmentStatus> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerComponent(),
        backgroundColor: Color(0xffffffff),
        appBar:AppBarComponent("Appointment Status"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("appointments").where("uid",isEqualTo: auth.currentUser!.uid).snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(itemCount: snapshot.data?.docs.length,itemBuilder: (context,index){
                if (snapshot.hasData) {
                  if (snapshot.data.docs.length > 0) {
                    AppointmentModel appointment = AppointmentModel.fromJson(snapshot.data?.docs[index]);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: AppointmentStatusCard(appointment),
                    );
                  }else{
                    return Center(child: Text("No Appointments"),);
                  }
                }
                else{
                  return Center(child: CircularProgressIndicator(),);
                }
              });
            },
          ),
        ));

  }
}

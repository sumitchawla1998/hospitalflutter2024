import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hmsbysumit/components/AppointmentCardPending.dart';
import 'package:hmsbysumit/models/appointmentmodel.dart';

import '../components/AppBarComponent.dart';
import '../components/AppointmentCardConfirm.dart';
import '../components/DrawerComponent.dart';
class AdminViewConfirmAppointments extends StatefulWidget {
  const AdminViewConfirmAppointments({Key? key}) : super(key: key);

  @override
  State<AdminViewConfirmAppointments> createState() => _AdminViewConfirmAppointmentsState();
}

class _AdminViewConfirmAppointmentsState extends State<AdminViewConfirmAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerComponent(),
        backgroundColor: Color(0xffffffff),
        appBar:AppBarComponent("Confirm Appointments"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("appointments").where("status",isEqualTo: "Confirmed").snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(itemCount: snapshot.data?.docs.length,itemBuilder: (context,index){
                if (snapshot.hasData) {
                  if (snapshot.data.docs.length > 0) {
                    AppointmentModel appointment = AppointmentModel.fromJson(snapshot.data?.docs[index]);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: AppointmentCardConfirm(appointment),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmsbysumit/components/AppBarComponent.dart';
import 'package:hmsbysumit/components/ButtonComponent.dart';
import 'package:hmsbysumit/components/DropdownComponent.dart';
import 'package:hmsbysumit/components/PasswordFieldComponent.dart';
import 'package:hmsbysumit/services/appointmentservice.dart';
import 'package:hmsbysumit/services/doctorservice.dart';

import '../components/TextFieldComponent.dart';
import '../utils/messages.dart';

class AdminAddPrescription extends StatefulWidget implements PreferredSizeWidget {
  String? id;
  AdminAddPrescription(this.id);

  @override
  State<AdminAddPrescription> createState() => _AdminAddPrescriptionState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _AdminAddPrescriptionState extends State<AdminAddPrescription> {
  TextEditingController diseasescontroller = TextEditingController();
  TextEditingController allergiescontroller = TextEditingController();
  TextEditingController prescriptioncontroller = TextEditingController();

  Future addprescription()async{
    if(diseasescontroller.text == "" || allergiescontroller.text == "" || prescriptioncontroller.text == ""){
      error(context,"All Fields Are Required", Colors.red);
      return;
    }
    await AppointmentService().addprescription(widget.id,diseasescontroller.text, allergiescontroller.text,prescriptioncontroller.text);
    success(context, "Prescription Saved",Colors.green);

    diseasescontroller.text = "";
    allergiescontroller.text = "";
    prescriptioncontroller.text = "";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarComponent("Add Prescription"),
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100,left: 30,right: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFieldComponent(diseasescontroller,"Diseases"),
                  TextFieldComponent(allergiescontroller,"Allergies"),
                  TextFieldComponent(prescriptioncontroller,"Prescription"),
                  ButtonComponent(addprescription, "Add Prescription"),
                ],
              ),
            ),
          ),
        ));
  }
}

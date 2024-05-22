import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hmsbysumit/components/DrawerComponent.dart';
import 'package:hmsbysumit/models/doctormodel.dart';
import 'package:hmsbysumit/services/appointmentservice.dart';

import '../components/AppBarComponent.dart';
import '../components/ButtonComponent.dart';
import '../components/DateFieldController.dart';
import '../components/DropdownComponent.dart';
import '../components/TextFieldComponent.dart';
import '../services/doctorservice.dart';
import '../utils/messages.dart';
class PatientBookAppointment extends StatefulWidget {
  DoctorModel doctor;
  PatientBookAppointment(this.doctor);

  @override
  State<PatientBookAppointment> createState() => _PatientBookAppointmentState();
}

class _PatientBookAppointmentState extends State<PatientBookAppointment> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController specialitycontroller = TextEditingController();
  TextEditingController feescontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  String? drpvalue  = "9AM to 10AM";

  List<String> time = ['9AM to 10AM', '10AM to 11AM', '11AM to 12AM'];



  Future addappointment()async{
    if(datecontroller.text == ""){
      error(context,"All Fields Are Required", Colors.red);
      return;
    }
    await AppointmentService().bookappointment(namecontroller.text,specialitycontroller.text,int.parse(feescontroller.text),datecontroller.text,drpvalue!);
    success(context, "Appointment Booked",Colors.green);
    //
    // namecontroller.text = "";
    // emailcontroller.text = "";
    // mobilecontroller.text = "";
    // feescontroller.text = "";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    namecontroller.text = widget.doctor.name!;
    specialitycontroller.text = widget.doctor.speciality!;
    feescontroller.text = widget.doctor.fees.toString()!;

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
        appBar: AppBarComponent("Book Appointment"),
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100,left: 30,right: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFieldComponent(namecontroller,"Doctor",false),
                  TextFieldComponent(specialitycontroller,"Speciality",false),
                  TextFieldComponent(feescontroller,"Fees",false),
                  DateFieldComponent(datecontroller,"Appointment Date"),
                  DropdownComponent(drpvalue,time,(value) {
                    setState(() {
                      drpvalue = value;
                    });
                  }),
                  ButtonComponent(addappointment, "Book Appointment"),
                  // TextFieldComponent(emailcontroller,"Email"),
                  // TextFieldComponent(mobilecontroller,"Mobile"),
                ],
              ),
            ),
          ),
        ));;
  }
}

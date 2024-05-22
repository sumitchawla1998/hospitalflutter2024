import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmsbysumit/components/AppBarComponent.dart';
import 'package:hmsbysumit/components/ButtonComponent.dart';
import 'package:hmsbysumit/components/DrawerComponent.dart';
import 'package:hmsbysumit/components/DropdownComponent.dart';
import 'package:hmsbysumit/components/PasswordFieldComponent.dart';
import 'package:hmsbysumit/services/doctorservice.dart';

import '../components/TextFieldComponent.dart';
import '../utils/messages.dart';

class AdminAddDoctor extends StatefulWidget implements PreferredSizeWidget {
  const AdminAddDoctor({Key? key}) : super(key: key);

  @override
  State<AdminAddDoctor> createState() => _AdminAddDoctorState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _AdminAddDoctorState extends State<AdminAddDoctor> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  String? drpvalue1  = "Dentist";
  String? drpvalue2  = "Male";
  TextEditingController feescontroller = TextEditingController();

  List<String> specialities = ['Dentist', 'Physician','Neurologist'];
  List<String> gender = ['Male', 'Female', 'Others'];


  Future adddoctor()async{
    if(namecontroller.text == "" || emailcontroller.text == "" || mobilecontroller.text == "" || feescontroller.text == ""){
      error(context,"All Fields Are Required", Colors.red);
      return;
    }
    await DoctorService().adddoctor(namecontroller.text, emailcontroller.text,mobilecontroller.text,drpvalue1!,drpvalue2!, int.parse(feescontroller.text));
    success(context, "Doctor Added",Colors.green);

    namecontroller.text = "";
    emailcontroller.text = "";
    mobilecontroller.text = "";
    feescontroller.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
        appBar: AppBarComponent("Add Doctor"),
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100,left: 30,right: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  TextFieldComponent(namecontroller,"Doctor"),
                  TextFieldComponent(emailcontroller,"Email"),
                  TextFieldComponent(mobilecontroller,"Mobile"),
                  DropdownComponent(drpvalue1, specialities, (value) {
                    setState(() {
                      drpvalue1 = value;
                    });
                  }),
                  DropdownComponent(drpvalue2, gender, (value) {
                    setState(() {
                      drpvalue2 = value;
                    });
                  }),
                  TextFieldComponent(feescontroller,"Fees"),
                  ButtonComponent(adddoctor, "Add Doctor"),
                ],
              ),
            ),
          ),
        ));
  }
}

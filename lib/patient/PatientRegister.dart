import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmsbysumit/components/ButtonComponent.dart';
import 'package:hmsbysumit/components/DropdownComponent.dart';
import 'package:hmsbysumit/components/PasswordFieldComponent.dart';
import 'package:hmsbysumit/patient/PatientLogin.dart';
import 'package:hmsbysumit/services/patientservice.dart';

import '../components/TextFieldComponent.dart';
import '../utils/messages.dart';

class PatientRegister extends StatefulWidget {
  const PatientRegister({Key? key}) : super(key: key);

  @override
  State<PatientRegister> createState() => _PatientRegisterState();
}

class _PatientRegisterState extends State<PatientRegister> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();

  String? drpvalue  = "Male";

  List<String> gender = ['Male', 'Female', 'Others'];


  Future register() async {
    User? user = await PatientService().register(namecontroller.text,emailcontroller.text, pwdcontroller.text,drpvalue);
    if(user != null){
      success(context, "Patient Registered", Colors.green);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientLogin()));
    }
    else
    {
      error(context, "Patient Registration Failed", Colors.red);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 100, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Image.asset("images/login.png", fit: BoxFit.cover),
              ),
              Text(
                "Sign Up",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
              TextFieldComponent(namecontroller, "Name:"),
              TextFieldComponent(emailcontroller, "Email"),
              PasswordFieldComponent(pwdcontroller, "Password"),
              DropdownComponent(drpvalue, gender,(value) {
                setState(() {
                  drpvalue = value;
                });
              }),
              ButtonComponent(register, "Register"),
            ],
          ),
        )),
      ),
    );
  }
}

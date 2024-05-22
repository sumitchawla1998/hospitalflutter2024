import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmsbysumit/components/ButtonComponent.dart';
import 'package:hmsbysumit/components/PasswordFieldComponent.dart';
import 'package:hmsbysumit/patient/PatientRegister.dart';
import 'package:hmsbysumit/patient/PatientViewDoctors.dart';
import 'package:hmsbysumit/services/patientservice.dart';

import '../components/TextFieldComponent.dart';
import '../utils/messages.dart';

class PatientLogin extends StatefulWidget {
  const PatientLogin({Key? key}) : super(key: key);

  @override
  State<PatientLogin> createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();

  Future login() async {
    User? user = await PatientService().login(emailcontroller.text, pwdcontroller.text);
    if(user != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PatientViewDoctors()));
    }else{
      error(context, "Please Enter Valid Email Or Password", Colors.redAccent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 100,left: 30,right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Image.asset("images/login.png",fit: BoxFit.cover),
              ),
              Text(
                "Sign In",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
              TextFieldComponent(emailcontroller,"Email"),
              PasswordFieldComponent(pwdcontroller,"Password"),
              ButtonComponent(login, "Login"),
              SizedBox(height: 10,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PatientRegister()));
              }, child: Text("Not Have An Account?Register",style: TextStyle(color: Color(0xff1a3d7d),fontSize: 20),),)
            ],
          ),
        ));
  }
}

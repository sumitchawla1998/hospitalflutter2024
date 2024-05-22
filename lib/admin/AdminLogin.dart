import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmsbysumit/components/ButtonComponent.dart';
import 'package:hmsbysumit/components/PasswordFieldComponent.dart';

import '../components/TextFieldComponent.dart';
import '../services/adminservice.dart';
import '../utils/messages.dart';
import 'AdminDashboard.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController unmcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();

  Future login() async {
    int l = await AdminService().login(unmcontroller.text, pwdcontroller.text);
    if(l == 1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminDashboard()));
    }else{
      error(context, "Please Enter Valid Credentials", Colors.red);
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
                width: 100,
                height: 100,
                child: Image.asset("images/login.png",fit: BoxFit.cover),
              ),
              Text(
                "Sign In",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
              TextFieldComponent(unmcontroller,"Username"),
              PasswordFieldComponent(pwdcontroller,"Password"),
              ButtonComponent(login, "Login"),
            ],
          ),
        ));
  }
}

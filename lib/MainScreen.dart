import 'package:flutter/material.dart';
import 'package:hmsbysumit/admin/AdminLogin.dart';
import 'package:hmsbysumit/components/ButtonComponent.dart';
import 'package:hmsbysumit/patient/PatientLogin.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 24),
              width: 260,
              child: Image.asset("images/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Book Appointment Online With Meddox Doctor App",textAlign: TextAlign.center,style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Color(0xff1a3d7d)),),
            ),

            SizedBox(height: 24.0,),
            ButtonComponent(() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLogin()));
            }, "Admin Login"),
            SizedBox(height: 24,),
            ButtonComponent(() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientLogin()));
            }, "Patient Login")

          ],
        ),
      ),
    );;
  }
}

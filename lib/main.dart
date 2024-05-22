import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hmsbysumit/MainScreen.dart';
import 'package:hmsbysumit/admin/AdminAddDoctor.dart';
import 'package:hmsbysumit/admin/AdminAddPrescription.dart';
import 'package:hmsbysumit/admin/AdminDashboard.dart';
import 'package:hmsbysumit/admin/AdminLogin.dart';
import 'package:hmsbysumit/admin/AdminViewConfirmAppointments.dart';
import 'package:hmsbysumit/admin/AdminViewDoctors.dart';
import 'package:hmsbysumit/admin/AdminViewPendingAppointments.dart';
import 'package:hmsbysumit/patient/PatientAppointmentStatus.dart';
import 'package:hmsbysumit/patient/PatientBookAppointment.dart';
import 'package:hmsbysumit/patient/PatientLogin.dart';
import 'package:hmsbysumit/patient/PatientRegister.dart';
import 'package:hmsbysumit/patient/PatientViewDoctors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MainScreen(),
  ));
}



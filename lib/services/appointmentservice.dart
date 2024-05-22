import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AppointmentService{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future bookappointment(String name,String speciality,int fees,String date,String time) async {
    try{
      await firestore.collection("appointments").add({
        "name":name,
        "speciality":speciality,
        "fees":fees,
        "date":date,
        "time":time,
        "patient":auth.currentUser?.displayName,
        "uid":auth.currentUser?.uid,
        "status":"Pending",
        "allergies":"",
        "diseases":"",
        "prescription":"",
      });
    }catch(e){
      print(e);
    }
  }

  Future confirmappointment(String? id) async {
    try{
      await firestore.collection("appointments").doc(id).update({
        "status":"Confirmed"
      });
    }catch(e){
      print(e);
    }
  }

  Future cancelappointment(String? id) async {
    try{
      await firestore.collection("appointments").doc(id).update({
        "status":"Cancelled"
      });
    }catch(e){
      print(e);
    }
  }

  Future addprescription(String? id,diseases,allergies,prescription) async {
    try{
      await firestore.collection("appointments").doc(id).update({
        "status":"Confirmed",
        "diseases":diseases,
        "allergies":allergies,
        "prescription":prescription,
      });
    }catch(e){
      print(e);
    }
  }

  // Future deletepackage(String? id)async{
  //   try{
  //     await firestore.collection("packages").doc(id).delete();
  //   }catch(e){
  //     print(e);
  //   }
  // }
}
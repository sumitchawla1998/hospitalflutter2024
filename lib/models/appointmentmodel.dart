import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel{
  String? id;
  String? name;
  String? speciality;
  int? fees;
  String? date;
  String? time;
  String? uid;
  String? patient;
  String? status;
  String? diseases = "";
  String? allergies = "";
  String? prescription = "";

  AppointmentModel({this.id,this.name,this.speciality,this.fees,this.date,this.time,this.uid,this.patient,this.status,this.diseases,this.allergies,this.prescription});

  factory AppointmentModel.fromJson(DocumentSnapshot snapshot){
    return AppointmentModel(
      id:snapshot.id,
      name:snapshot["name"],
      speciality:snapshot["speciality"],
      fees:snapshot["fees"],
      date:snapshot["date"],
      time:snapshot["time"],
      uid:snapshot["uid"],
      patient:snapshot["patient"],
      status:snapshot["status"],
      diseases:snapshot["diseases"],
      allergies:snapshot["allergies"],
      prescription:snapshot["prescription"],
    );
  }
}
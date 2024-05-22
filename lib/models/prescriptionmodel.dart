import 'package:cloud_firestore/cloud_firestore.dart';

class PrescriptionModel{
  String? id;
  String? diseases;
  String? allergies;
  String? prescription;


  PrescriptionModel({this.id,this.diseases,this.allergies,this.prescription});

  factory PrescriptionModel.fromJson(DocumentSnapshot snapshot){
    return PrescriptionModel(
      id:snapshot.id,
      diseases:snapshot["diseases"],
      allergies:snapshot["allergies"],
      prescription:snapshot["prescription"],

    );
  }
}
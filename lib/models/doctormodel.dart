import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel{
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? speciality;
  String? gender;
  int? fees;

  DoctorModel({this.id,this.name,this.email,this.mobile,this.speciality,this.gender,this.fees});

  factory DoctorModel.fromJson(DocumentSnapshot snapshot){
    return DoctorModel(
      id:snapshot.id,
      name:snapshot["name"],
      email:snapshot["email"],
      mobile:snapshot["mobile"],
      speciality:snapshot["speciality"],
      gender:snapshot["gender"],
      fees:snapshot["fees"],
    );
  }
}
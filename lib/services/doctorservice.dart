import 'package:cloud_firestore/cloud_firestore.dart';
class DoctorService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future adddoctor(String name,String email,String mobile,String speciality,String gender,int fees) async {
    try{
      await firestore.collection("doctors").add({
        "name":name,
        "email":email,
        "mobile":mobile,
        "speciality":speciality,
        "gender":gender,
        "fees":fees
      });
    }catch(e){
      print(e);
    }
  }

  Future deletepackage(String? id)async{
    try{
      await firestore.collection("packages").doc(id).delete();
    }catch(e){
      print(e);
    }
  }
}